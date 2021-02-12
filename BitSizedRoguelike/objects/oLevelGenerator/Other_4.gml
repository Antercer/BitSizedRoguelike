/// @description Insert description here
// You can write your code in this editor

#region rRooms

if room == rRooms {
	for (var lal = 0; lal < nRooms; lal++) {
		rooms[lal] = ds_list_create();
	}
	var layerId, elements, element, oi, xx, yy, xStart, yStart, n, re;
	layerId = layer_get_id("Instances");
	elements = layer_get_all_elements(layerId);
	for (var i = 0; i < array_length(elements); i++){
		element = layer_instance_get_instance(elements[i]);
		oi = element.object_index;
		xx = element.x;
		yy = element.y;
		xStart = floor(xx/global.roomWidth);
		yStart = floor(yy/global.roomHeight);
	
		n = xStart + 4*yStart;
		re = new roomElement(oi, xx-xStart*global.roomWidth, yy-yStart*global.roomHeight)
		ds_list_add(rooms[n], re);
	}
	room_goto(rGame);
}

#endregion

#region rGame

else if room == rGame {
	var size, i, xStart, selectedRoom, ii, a, layId;
	size = 4;
	layId = layer_get_id("Instances");
	for (i = 0; i < size; i++){
		xStart = i * global.roomWidth;
		selectedRoom = rooms[irandom(nRooms-1)];
		for (ii = 0; ii < ds_list_size(selectedRoom); ii++){
			a = selectedRoom[|ii];
			instance_create_layer(a.objectX+xStart, a.objectY, layId, a.objectType);
		}
	}
}

#endregion