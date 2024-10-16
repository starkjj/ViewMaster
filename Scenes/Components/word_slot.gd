extends PanelContainer

var dragdrop_label:PackedScene = preload("res://Scenes/drag_label.tscn")
var holds_word:bool = false
var correct_word:String
var current_label
var current_dragdrop

@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not holds_word:
		custom_minimum_size.x = 100

func _can_drop_data(_position: Vector2, drag_label) -> bool:
	var can_drop: bool = drag_label is Node and drag_label.is_in_group("draggable")
	return can_drop

func _drop_data(_position: Vector2, drag_label) -> void:
	drag_label._set_in_use(true)
	_set_label(drag_label.text)
	current_dragdrop = drag_label
	custom_minimum_size.x = 0
	holds_word = true
	
	if drag_label.text == correct_word:
		$Label.modulate = Color(Color.GREEN, 1.0)
		print(correct_word + " is correct")
	else:
		$Label.modulate = Color(Color.CRIMSON, 1.0)
		print(drag_label.text + " is wrong")

# Set the slots lavel
func _set_label(text):
	current_label = text
	label.text = text

# Picking up the word again
func _get_drag_data(at_position: Vector2) -> Variant:
	set_drag_preview(_get_preview_control())
	_set_label("")
	holds_word = false
	custom_minimum_size.x = 100
	
	# Tells the current dragdrop that it's not being used
	current_dragdrop._set_in_use(false)
	
	return self

func _get_preview_control() -> Control:
	var drag_preview = dragdrop_label.instantiate()
	drag_preview.text = current_label
	
	# Centers the mouse
	var center_on_mouse_control = Control.new()
	center_on_mouse_control.add_child(drag_preview)
	drag_preview.position = -0.5 * drag_preview.size
	return center_on_mouse_control
