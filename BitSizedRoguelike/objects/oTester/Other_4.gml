/// @description Insert description here
// You can write your code in this editor
if room != rRooms exit;

for (var lal = 0; lal < 5; lal++) {
	rooms[lal] = ds_list_create(); 
}

var layerId = layer_get_id("Instances");
var elements = layer_get_all_elements(layerId);
for (var i = 0; i < array_length(elements); i++){
	var element = layer_instance_get_instance(elements[i]);
	var oi = element.object_index;
	var xx = element.x;
	var yy = element.y;
	var xStart = floor(xx/global.roomWidth);
	var yStart = floor(yy/global.roomHeight);
	
	var n = xStart + 4*yStart;
	var re = new roomElement(oi, xx-xStart, yy-yStart)
	ds_list_add(rooms[n], re);
}

room_goto(rGame);





/*
for (var roomN = 0; roomN < roomNumber; roomN++){
	var xStart, yStart, xEnd, yEnd;
	xStart = roomN * global.roomWidth;
	yStart = roomN * global.roomHeight;
	xEnd   = xStart + global.roomWidth;
	yEnd   = yStart + global.roomHeight;
	
	
}*/

/*
rooms[roomN] = 0;
var roomObjects = 0;
	
var layerId = layer_get_id("Instances");
var elements = layer_get_all_elements(layerId);
for (var i = 0; i < array_length(elements); i++){
	var element = layer_instance_get_instance(elements[i]);
	var oi = element.object_index;
	var xx = element.x;
	var yy = element.y;
	
	roomObjects[i] = new roomElement(oi, xx, yy);
}

rooms[roomCount] = roomObjects;
roomCount++;
*/