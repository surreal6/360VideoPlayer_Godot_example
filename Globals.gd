extends Node

var viewportTarget
var playlist := []
var playListIndex := 0

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
