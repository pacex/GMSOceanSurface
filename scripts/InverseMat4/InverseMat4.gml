// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function InverseMat4(matrix){
	var Original = ScrMatrixToArray2d( matrix, 4 );
	var Result;
	var tmp;

	var det = Original[3,0] * Original[2,1] * Original[1,2] * Original[0,3] - Original[2,0] * Original[3,1] * Original[1,2] * Original[0,3] - Original[3,0] * Original[1,1]
	        * Original[2,2] * Original[0,3] + Original[1,0] * Original[3,1] * Original[2,2] * Original[0,3] + Original[2,0] * Original[1,1] * Original[3,2] * Original[0,3] - Original[1,0]
	        * Original[2,1] * Original[3,2] * Original[0,3] - Original[3,0] * Original[2,1] * Original[0,2] * Original[1,3] + Original[2,0] * Original[3,1] * Original[0,2] * Original[1,3]
	        + Original[3,0] * Original[0,1] * Original[2,2] * Original[1,3] - Original[0,0] * Original[3,1] * Original[2,2] * Original[1,3] - Original[2,0] * Original[0,1] * Original[3,2]
	        * Original[1,3] + Original[0,0] * Original[2,1] * Original[3,2] * Original[1,3] + Original[3,0] * Original[1,1] * Original[0,2] * Original[2,3] - Original[1,0] * Original[3,1]
	        * Original[0,2] * Original[2,3] - Original[3,0] * Original[0,1] * Original[1,2] * Original[2,3] + Original[0,0] * Original[3,1] * Original[1,2] * Original[2,3] + Original[1,0]
	        * Original[0,1] * Original[3,2] * Original[2,3] - Original[0,0] * Original[1,1] * Original[3,2] * Original[2,3] - Original[2,0] * Original[1,1] * Original[0,2] * Original[3,3]
	        + Original[1,0] * Original[2,1] * Original[0,2] * Original[3,3] + Original[2,0] * Original[0,1] * Original[1,2] * Original[3,3] - Original[0,0] * Original[2,1] * Original[1,2]
	        * Original[3,3] - Original[1,0] * Original[0,1] * Original[2,2] * Original[3,3] + Original[0,0] * Original[1,1] * Original[2,2] * Original[3,3];

	var inv_det = 1.0 / det;

	tmp[0,0] = Original[1,2] * Original[2,3] * Original[3,1] - Original[1,3] * Original[2,2] * Original[3,1] + Original[1,3] * Original[2,1] * Original[3,2] - Original[1,1]
	* Original[2,3] * Original[3,2] - Original[1,2] * Original[2,1] * Original[3,3] + Original[1,1] * Original[2,2] * Original[3,3];
	tmp[0,1] = Original[0,3] * Original[2,2] * Original[3,1] - Original[0,2] * Original[2,3] * Original[3,1] - Original[0,3] * Original[2,1] * Original[3,2] + Original[0,1]
	* Original[2,3] * Original[3,2] + Original[0,2] * Original[2,1] * Original[3,3] - Original[0,1] * Original[2,2] * Original[3,3];
	tmp[0,2] = Original[0,2] * Original[1,3] * Original[3,1] - Original[0,3] * Original[1,2] * Original[3,1] + Original[0,3] * Original[1,1] * Original[3,2] - Original[0,1]
	* Original[1,3] * Original[3,2] - Original[0,2] * Original[1,1] * Original[3,3] + Original[0,1] * Original[1,2] * Original[3,3];
	tmp[0,3] = Original[0,3] * Original[1,2] * Original[2,1] - Original[0,2] * Original[1,3] * Original[2,1] - Original[0,3] * Original[1,1] * Original[2,2] + Original[0,1]
	* Original[1,3] * Original[2,2] + Original[0,2] * Original[1,1] * Original[2,3] - Original[0,1] * Original[1,2] * Original[2,3];
	tmp[1,0] = Original[1,3] * Original[2,2] * Original[3,0] - Original[1,2] * Original[2,3] * Original[3,0] - Original[1,3] * Original[2,0] * Original[3,2] + Original[1,0]
	* Original[2,3] * Original[3,2] + Original[1,2] * Original[2,0] * Original[3,3] - Original[1,0] * Original[2,2] * Original[3,3];
	tmp[1,1] = Original[0,2] * Original[2,3] * Original[3,0] - Original[0,3] * Original[2,2] * Original[3,0] + Original[0,3] * Original[2,0] * Original[3,2] - Original[0,0]
	* Original[2,3] * Original[3,2] - Original[0,2] * Original[2,0] * Original[3,3] + Original[0,0] * Original[2,2] * Original[3,3];
	tmp[1,2] = Original[0,3] * Original[1,2] * Original[3,0] - Original[0,2] * Original[1,3] * Original[3,0] - Original[0,3] * Original[1,0] * Original[3,2] + Original[0,0]
	* Original[1,3] * Original[3,2] + Original[0,2] * Original[1,0] * Original[3,3] - Original[0,0] * Original[1,2] * Original[3,3];
	tmp[1,3] = Original[0,2] * Original[1,3] * Original[2,0] - Original[0,3] * Original[1,2] * Original[2,0] + Original[0,3] * Original[1,0] * Original[2,2] - Original[0,0]
	* Original[1,3] * Original[2,2] - Original[0,2] * Original[1,0] * Original[2,3] + Original[0,0] * Original[1,2] * Original[2,3];
	tmp[2,0] = Original[1,1] * Original[2,3] * Original[3,0] - Original[1,3] * Original[2,1] * Original[3,0] + Original[1,3] * Original[2,0] * Original[3,1] - Original[1,0]
	* Original[2,3] * Original[3,1] - Original[1,1] * Original[2,0] * Original[3,3] + Original[1,0] * Original[2,1] * Original[3,3];
	tmp[2,1] = Original[0,3] * Original[2,1] * Original[3,0] - Original[0,1] * Original[2,3] * Original[3,0] - Original[0,3] * Original[2,0] * Original[3,1] + Original[0,0]
	* Original[2,3] * Original[3,1] + Original[0,1] * Original[2,0] * Original[3,3] - Original[0,0] * Original[2,1] * Original[3,3];
	tmp[2,2] = Original[0,1] * Original[1,3] * Original[3,0] - Original[0,3] * Original[1,1] * Original[3,0] + Original[0,3] * Original[1,0] * Original[3,1] - Original[0,0]
	* Original[1,3] * Original[3,1] - Original[0,1] * Original[1,0] * Original[3,3] + Original[0,0] * Original[1,1] * Original[3,3];
	tmp[2,3] = Original[0,3] * Original[1,1] * Original[2,0] - Original[0,1] * Original[1,3] * Original[2,0] - Original[0,3] * Original[1,0] * Original[2,1] + Original[0,0]
	* Original[1,3] * Original[2,1] + Original[0,1] * Original[1,0] * Original[2,3] - Original[0,0] * Original[1,1] * Original[2,3];
	tmp[3,0] = Original[1,2] * Original[2,1] * Original[3,0] - Original[1,1] * Original[2,2] * Original[3,0] - Original[1,2] * Original[2,0] * Original[3,1] + Original[1,0]
	* Original[2,2] * Original[3,1] + Original[1,1] * Original[2,0] * Original[3,2] - Original[1,0] * Original[2,1] * Original[3,2];
	tmp[3,1] = Original[0,1] * Original[2,2] * Original[3,0] - Original[0,2] * Original[2,1] * Original[3,0] + Original[0,2] * Original[2,0] * Original[3,1] - Original[0,0]
	* Original[2,2] * Original[3,1] - Original[0,1] * Original[2,0] * Original[3,2] + Original[0,0] * Original[2,1] * Original[3,2];
	tmp[3,2] = Original[0,2] * Original[1,1] * Original[3,0] - Original[0,1] * Original[1,2] * Original[3,0] - Original[0,2] * Original[1,0] * Original[3,1] + Original[0,0]
	* Original[1,2] * Original[3,1] + Original[0,1] * Original[1,0] * Original[3,2] - Original[0,0] * Original[1,1] * Original[3,2];
	tmp[3,3] = Original[0,1] * Original[1,2] * Original[2,0] - Original[0,2] * Original[1,1] * Original[2,0] + Original[0,2] * Original[1,0] * Original[2,1] - Original[0,0]
	* Original[1,2] * Original[2,1] - Original[0,1] * Original[1,0] * Original[2,2] + Original[0,0] * Original[1,1] * Original[2,2];

	Result[0,0] = tmp[0,0] * inv_det;
	Result[0,1] = tmp[0,1] * inv_det;
	Result[0,2] = tmp[0,2] * inv_det;
	Result[0,3] = tmp[0,3] * inv_det;
	Result[1,0] = tmp[1,0] * inv_det;
	Result[1,1] = tmp[1,1] * inv_det;
	Result[1,2] = tmp[1,2] * inv_det;
	Result[1,3] = tmp[1,3] * inv_det;
	Result[2,0] = tmp[2,0] * inv_det;
	Result[2,1] = tmp[2,1] * inv_det;
	Result[2,2] = tmp[2,2] * inv_det;
	Result[2,3] = tmp[2,3] * inv_det;
	Result[3,0] = tmp[3,0] * inv_det;
	Result[3,1] = tmp[3,1] * inv_det;
	Result[3,2] = tmp[3,2] * inv_det;
	Result[3,3] = tmp[3,3] * inv_det;

	return ScrArray2dToMatrix( Result, 4 );
}