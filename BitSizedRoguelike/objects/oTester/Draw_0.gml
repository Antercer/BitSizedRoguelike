/// @description Insert description here
// You can write your code in this editor
if room != rGame exit;
if keyboard_check_pressed(ord("A")) actualRoom--;
if keyboard_check_pressed(ord("D")) actualRoom++;

draw_set_font(fMain);
draw_text(x, y, "I exist!");
draw_text(32, 64, actualRoom);
var rm = rooms[actualRoom];
for (var i = 0; i < ds_list_size(rm); i++){
	var a = rm[|i];
	var xSub = 0//(actualRoom%4) * global.roomWidth;
	var ySub = 0//floor(actualRoom/4) * global.roomHeight;
	draw_text(a.objectX - xSub, a.objectY - ySub, object_get_name(a.objectType));
}