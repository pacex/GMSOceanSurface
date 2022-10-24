// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScrMatrixToArray2d(matrix, size){
	var M2D;
	var Counter = 0;
	for( var j=0; j<size; j++){
	    for( var i=0; i<size; i++ ){
	        M2D[i,j] = matrix[Counter];
	        Counter ++;
	    }
	}
	return M2D;
}