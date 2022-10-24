function ScrCameraRotate(){
	//Set up camera location
	var zz = -640;
	var xx = lengthdir_x(720,-current_time/40) + (room_width*0.5);//Rotation is negative now to match with the old gif and spin clockwise
	var yy = lengthdir_y(720,-current_time/40) + (room_height*0.5);

	//Build a matrix that looks from the camera location above, to the room center. The up vector points to -z
	var view = matrix_build_lookat(xx,yy,zz, (room_width*0.5),(room_height*0.5),0, 0,0,-1);

	//Assign the matrix to the camera. This updates were the camera is looking from, without having to unnecessarily update the projection.
	camera_set_view_mat(view_camera[0], view);
}