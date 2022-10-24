// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScrRandomUnitVec(){
	var dir = random(360)
	
	var ret;
	ret[2] = 1
	ret[1] = lengthdir_y(1, dir)
	ret[0] = lengthdir_x(1, dir)
	return ret
}