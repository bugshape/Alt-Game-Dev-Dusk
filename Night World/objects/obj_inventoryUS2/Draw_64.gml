/// @description 

if (showInv) {
	//room width and height
	var guiWidth = display_get_gui_width();
	var guiHeight = display_get_gui_height();
	
	var x1, x2, y1, y2;
	
	x1 = 0;
	x2 = x1 + guiWidth;
	y1 = 500;
	y2 = y1 + 218;
	
	//draw rectangle
	//draw_set_color(c_green);
	//draw_set_alpha(0.8);
	//draw_rectangle(x1, y1, x2, y2, 0);
	//draw_set_alpha(1);
	
	for (i = 0; i < maxItems; i += 1) {			//position x 
		draw_sprite(spr_inventorySlot, 0, x1+400+(i*550), y2-109);
		button[i].x = x1+499+(i*550);
		button[i].y = y2-145;
	}
}