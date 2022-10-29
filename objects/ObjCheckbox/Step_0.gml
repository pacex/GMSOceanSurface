/// @description Behaviour

if(mouse_check_button_pressed(mb_left)){
	var mx = window_mouse_get_x()
	var my = window_mouse_get_y()
	
	if (mx >= x && mx < x+32 && my >= y && my < y+32){
		value = !value
	}
}

