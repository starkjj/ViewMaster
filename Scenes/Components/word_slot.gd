extends PanelContainer

var drag_label:PackedScene = preload("res://Scenes/drag_label.tscn")
var holds_word:bool = false
var current_label

@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not holds_word:
		custom_minimum_size.x = 100

func _can_drop_data(_position: Vector2, drag_label) -> bool:
	if holds_word:
		return false
	var can_drop: bool = drag_label is Node and drag_label.is_in_group("draggable")
	return can_drop

func _drop_data(_position: Vector2, drag_label) -> void:
	_set_label(drag_label.text)
	custom_minimum_size.x = 0
	holds_word = true

# Picking up the word again
func _get_drag_data(at_position: Vector2) -> Variant:
	set_drag_preview(_get_preview_control())
	_set_label("")
	holds_word = false
	custom_minimum_size.x = 100
	return self

func _get_preview_control() -> Control:
	var drag_preview = drag_label.instantiate()
	drag_preview.text = current_label
	
	# Centers the mouse
	var center_on_mouse_control = Control.new()
	center_on_mouse_control.add_child(drag_preview)
	drag_preview.position = -0.5 * drag_preview.size
	return center_on_mouse_control

func _set_label(text):
	current_label = text
	label.text = text
