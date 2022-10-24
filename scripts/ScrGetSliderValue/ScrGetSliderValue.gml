// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScrGetSliderValue(inst){
	return lerp(inst.val_min, inst.val_max, inst.position)
}