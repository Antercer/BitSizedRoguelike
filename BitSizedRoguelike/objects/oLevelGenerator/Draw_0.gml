/// @description Insert description here
// You can write your code in this editor
if room != rGame exit;


/*
if keyboard_check_pressed(ord("A")) actualRoom--;
if keyboard_check_pressed(ord("D")) actualRoom++;

draw_set_font(fMain);
draw_text(x, y, "I exist!");
draw_text(32, 64, actualRoom);
var rm = rooms[actualRoom];
for (var i = 0; i < ds_list_size(rm); i++){
	var a = rm[|i];
	draw_text(a.objectX, a.objectY, object_get_name(a.objectType));
}