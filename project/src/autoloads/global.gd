extends Node

func map(value : float,start1 : float ,stop1 : float ,start2 : float,stop2 : float) -> float:	
	return start2 + ((value - start1)*(stop2 - start1)) / (stop1 - start1)
