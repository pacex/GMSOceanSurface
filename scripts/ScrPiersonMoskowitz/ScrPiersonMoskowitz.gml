// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScrPiersonMoskowitz(a, U, k){
	
	/* 
		Returns Pierson-Moskowitz wave spectrum density for given wavelength
	*/
	
	#macro G 9.81
	
	var angvec = sqrt(k * G)
	var B = 0.6858 * power(G / U, 4)
	var A = a * G
	
	return (A / power(angvec, 5)) * exp(-B/power(angvec, 4))
}