extends Node3D

## To run this project you need to install an alternative branch for XR Tools, until PR is accepted
##
## PR       https://github.com/GodotVR/godot-xr-tools/pull/558

@onready var r_cont = $XROrigin3D/RightController
@onready var l_cont = $XROrigin3D/LeftController
@onready var fileDialogViewport = $FileSystemSelectDir/FileSystemWindow

@onready var videoPlayer360 = $equi_2048/ViewportEquirectangular.get_scene_instance()
@onready var videoPlayerFlat = $flat_screen/screen.get_scene_instance()

var playlist := []
var playListIndex := 0

func _ready():
	fileDialogViewport.connect_scene_signal("dir_selected", on_dir_selected)
	
	r_cont.connect("button_pressed", on_controller_button_pressed)
	l_cont.connect("button_pressed", on_controller_button_pressed)

func dir_contents(path):
	playlist = []
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
			else:
				if file_name.ends_with(".ogv"):
					createVideoStreamTheora(path + "/" + file_name)
			file_name = dir.get_next()
		on_playlist_ready()

func createVideoStreamTheora(path):
	var theoraResource = VideoStreamTheora.new()
	theoraResource.set_file(ProjectSettings.globalize_path(path))
	playlist.append(theoraResource)

func nextIndex():
	playListIndex += 1
	if playListIndex > playlist.size() - 1:
		playListIndex = 0
	return playlist[playListIndex]

func prevIndex():
	playListIndex -= 1
	if playListIndex < 0:
		playListIndex = playlist.size() - 1
	return playlist[playListIndex]

func on_dir_selected(value):
	dir_contents(value)
	await get_tree().create_timer(0.5).timeout
	if playlist.size() > 0:
		playListIndex = 0
		var stream = playlist[playListIndex]
		videoPlayer360.loadStream(stream)
		videoPlayerFlat.loadStream(stream)
		fileDialogViewport.scene_node.modulate_label(playListIndex)

func on_playlist_ready():
	fileDialogViewport.scene_node.hide_file_dialog()
	fileDialogViewport.scene_node.clear_file_list()
	if playlist.size() > 0:
		for file in playlist:
			var array = file.get_file().rsplit("/")
			var filename = array[array.size() - 1]
			fileDialogViewport.scene_node.add_file_label(filename)

func on_controller_button_pressed(event):
	match event:
		"ax_button":
			if playlist.size() > 0:
				var stream = nextIndex()
				print(stream.file)
				videoPlayer360.loadStream(stream)
				videoPlayerFlat.loadStream(stream)
				fileDialogViewport.scene_node.modulate_label(playListIndex)
		"by_button":
			if playlist.size() > 0:
				var stream = prevIndex()
				videoPlayer360.loadStream(stream)
				videoPlayerFlat.loadStream(stream)
				fileDialogViewport.scene_node.modulate_label(playListIndex)
		"ax_touch":
			pass
		"by_touch":
			pass
		"trigger_click":
			pass
		"trigger_touch":
			pass
	
