/// @description Insert description here
// You can write your code in this editor

#region debug stuff

if keyboard_check_pressed(ord("R")) game_restart();

#endregion

#region input stuff
var keyLeft = keyboard_check(vk_left);
var keyRight = keyboard_check(vk_right);
var keyJump = keyboard_check_pressed(ord("Z"));
var keyJumpHeld = keyboard_check(ord("Z"));
#endregion

#region common variables
dir = keyRight-keyLeft;
if dir != 0 image_xscale = dir;
flooredPrev = floored;
floored = place_meeting(x, y+1, oWall);
#endregion

#region horizontal movement stuff

if floored {
	acc = accFloored;
	hFrict = hFrictFloored;
} else {
	acc = accAirborne;
	hFrict = hFrictAirborne;
}

//añadir a hspd
hspd = clamp(hspd+dir*acc, -maxSpd, maxSpd);

//chequear colisiones

if place_meeting((x + hspd), y, oWall){
	while !place_meeting((x + sign(hspd)), y, oWall){
		x += sign(hspd);
	}
	hspd = 0;
}

//mover al player
x += hspd;

//aplicar fricción
hspd = approach(hspd, 0, hFrict);

#endregion

#region vertical movement stuff
//setear gravedad
if vspd < 0 {
	if keyJumpHeld{
		grav = gravUp;
	}
	else{
		grav = gravDown*1.5
	}
}
else
	grav = gravDown

//todo lo de saltar
if keyJump {
	alarm[0] = 7;
	jumpBuffer = true;
}

//saltar
if  (floored || flooredPrev) && jumpBuffer {
	jumpBuffer = false;
	vspd = -jumpSpd;
}

vspd += grav;

//colisión hacia arriba
if vspd < 0{
	if place_meeting(x, (y + vspd), oWall){
		while !place_meeting(x, y-1, oWall) y--;
		vspd = 0;
	}
}

//colisión hacia abajo
if place_meeting(x, (y + vspd + 1), oWall){
	y = floor(y);
	if !floored while !place_meeting(x, y+1, oWall) y++;
	vspd = 0;
}

y += vspd;
#endregion


#region camera stuff (change later)

//view_xport[0] = x - (global.roomWidth/2); 
//view_yport[0] = 0;
view_xport[0] = floor(view_xport[0]);
view_yport[0] = floor(view_yport[0]);

#endregion
