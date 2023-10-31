extends Node3D

@onready var r_cont = $XROrigin3D/RightController
@onready var l_cont = $XROrigin3D/LeftController
@onready var fileDialogViewport = $FileSystemSelectDir/FileSystemWindow

func _ready():
	fileDialogViewport.connect_scene_signal("dir_selected", on_dir_selected)
	
	r_cont.connect("button_pressed", on_controller_button_pressed)
	l_cont.connect("button_pressed", on_controller_button_pressed)

func on_dir_selected(value):
	Globals.dir_contents(value)
	$FileSystemSelectDir.queue_free()
	await get_tree().create_timer(0.5).timeout
	var videoPlayer360 = $equi_2048/ViewportEquirectangular.get_scene_instance()
	var videoPlayerFlat = $flat_screen/screen.get_scene_instance()
	videoPlayer360.loadStream(Globals.playlist[0])
	videoPlayerFlat.loadStream(Globals.playlist[0])

func on_controller_button_pressed(event):
	var videoPlayer360 = $equi_2048/ViewportEquirectangular.get_scene_instance()
	var videoPlayerFlat = $flat_screen/screen.get_scene_instance()
	match event:
		"ax_button":
			var stream = Globals.nextIndex()
			videoPlayer360.loadStream(stream)
			videoPlayerFlat.loadStream(stream)
		"by_button":
			var stream = Globals.prevIndex()
			videoPlayer360.loadStream(stream)
			videoPlayerFlat.loadStream(stream)
		"ax_touch":
			pass
		"by_touch":
			pass
		"trigger_click":
			pass
		"trigger_touch":
			pass
	
