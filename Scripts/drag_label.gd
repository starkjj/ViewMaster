extends Control

var drag_label:PackedScene = preload("res://Scenes/drag_label.tscn")

@export var text:String = "Label";

@onready var label: Label = $PanelContainer/ColorRect/Label
@onready var panel_container: PanelContainer = $PanelContainer

func _ready() -> void:
	label.text = text
	add_to_group("draggable")
	
func _get_drag_data(at_position: Vector2) -> Variant:
	set_drag_preview(_get_preview_control())
	return self

func _get_preview_control() -> Control:
	var drag_preview = drag_label.instantiate()
	drag_preview.text = text
	
	# Centers the mouse
	var center_on_mouse_control = Control.new()
	center_on_mouse_control.add_child(drag_preview)
	drag_preview.position = -0.5 * drag_preview.size
	return center_on_mouse_control
