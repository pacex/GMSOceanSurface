/// @description Load Vertex Buffer, Wave Generation

surfacePlane = ScrVertBufCreatePlane(256, 512)

// Wave Generation
slider_windSpeed = noone;
slider_direction = noone;

globalvar amplitudes, kx, ky, NUM_WAVES;
NUM_WAVES = 64;

windSpeed = 3.5
ScrGenerateWaves(windSpeed, 0)



/*
var wave;


for (var i = 0; i < NUM_WAVES; i++){
	wave = 5 / (i/6 + 1)
	amplitudes[i] = random_range(1.8*wave, 3.2*wave)
		
	kx[i] = random_range(-1,1) * (2*i+1) / NUM_WAVES * 0.1
	ky[i] = random_range(-1,1) * (2*i+1) / NUM_WAVES * 0.1
}*/

