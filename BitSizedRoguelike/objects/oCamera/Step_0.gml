/// @description Insert description here
// You can write your code in this editor

#region seguir al player

x = lerp(x, oPlayer.x, 0.1);
y = 0;

#endregion

#region camera stuff (change later)

var cam = view_camera[0];
var camWidth = camera_get_view_width(cam);
var camXPos = clamp(x - camWidth/2, 0, room_width-camWidth);
camera_set_view_pos(cam, camXPos, 0);


#endregion
