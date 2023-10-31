extends Control

func loadStream(value):
	$VideoStreamPlayer.stream = value
	$VideoStreamPlayer.play()
