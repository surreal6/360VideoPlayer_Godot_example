extends Node3D

@onready var r_cont = $XROrigin3D/RightController
@onready var l_cont = $XROrigin3D/LeftController
@onready var fileDialogViewport = $FileSystemSelectDir/FileSystemWindow

func _ready():
	fileDialogViewport.connect_scene_signal("dir_selected", on_dir_selected)
	
	r_cont.connect("button_pressed", on_controller_button_pressed)
	l_cont.connect("button_pressed", on_controller_button_pressed)

func on_dir_selected(value):
	print(value)
	pass
	
func on_controller_button_pressed(event):
#	print(event)
	match event:
		"ax_button":
			pass
		"by_button":
			pass
		"ax_touch":
			pass
		"by_touch":
			pass
		"trigger_click":
			pass
		"trigger_touch":
			pass
	
