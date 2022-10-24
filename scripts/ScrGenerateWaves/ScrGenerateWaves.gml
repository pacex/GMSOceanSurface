// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScrGenerateWaves(windSpeed, windDirection){
	
	for (var i = 0; i < NUM_WAVES; i++){
		var wavelength = lerp(0.01, 8, i/NUM_WAVES) // equdistant sampling of continuous wave spectrum
	
		var wave_vector = ScrRandomUnitVec()
		wave_vector[0] *= wavelength
		wave_vector[1] *= wavelength
	
		kx[i] = wave_vector[0]
		ky[i] = wave_vector[1]
	
		amplitudes[i] = ScrPiersonMoskowitz(2.8, windSpeed, wavelength)
	}
}