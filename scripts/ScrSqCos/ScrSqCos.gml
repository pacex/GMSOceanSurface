// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScrSqCos(dir){
	var dir_offset = random_range(-pi/2,pi/2)
	
	var a = power(cos(dir_offset), 2)
	
	var ret;
	ret[2] = a
	ret[1] = lengthdir_y(1, dir + radtodeg(dir_offset))
	ret[0] = lengthdir_x(1, dir + radtodeg(dir_offset))
	return ret
}