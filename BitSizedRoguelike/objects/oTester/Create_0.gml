/// @description Insert description here
// You can write your code in this editor

#region create struct

function roomElement(object_type, object_x, object_y) constructor {
	objectType = object_type;
	objectX = object_x;
	objectY = object_y;
}

#endregion

room_goto(rRooms);
actualRoom = 0;
nRooms = 5;
global.roomWidth = 320;
global.roomHeight = 224;