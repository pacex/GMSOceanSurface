/// @description 3D Init

gpu_set_zwriteenable(true)
gpu_set_ztestenable(true)

layer_force_draw_depth(true, 0)

// Camera
camera = camera_create()

// Camera properties
x = 0
y = 0
z = -64
azimuth = 0
elevation = 0

globalvar view, projection, invView, camNear, camFar;
camNear = 1
camFar = 2048

projection = matrix_build_projection_perspective_fov(-60, -view_get_wport(0)/view_get_hport(0), camNear, camFar)
camera_set_proj_mat(camera, projection)

view = matrix_build_lookat(x,y,z,  // from
			sin(azimuth) * cos(elevation), cos(azimuth) * cos(elevation), sin(elevation), // to
			0,0,-1) // up

invView = InverseMat4(view);

view_set_camera(0, camera);

// Depth and Albedo surfaces
globalvar depthSurface, albedoSurface;
depthSurface = surface_create(window_get_width(), window_get_height())
albedoSurface = surface_create(window_get_width(), window_get_height())

// Vertex buffer format
globalvar vertexBufferFormat, vertexBufferFormatModel;
vertexBufferFormat = ScrVertBufFormatDefault()
vertexBufferFormatModel = ScrVertBufFormatModel()