// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScrResetWorldMat(){
	matrix_set(matrix_world, matrix_build(0,0,0, 0,0,0, 1,1,1))
}