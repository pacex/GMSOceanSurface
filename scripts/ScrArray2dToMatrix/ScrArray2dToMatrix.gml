// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScrArray2dToMatrix(array, size){
	var M;
	var Counter = 0;
	for( var j=0; j<size; j++){
	    for( var i=0; i<size; i++ ){
	        M[Counter] = array[i,j];
	        Counter ++;
	    }
	}
	return M;
}