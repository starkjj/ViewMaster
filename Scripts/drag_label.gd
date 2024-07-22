extends Control

var draggable = false
var is_inside_droppable = false
var body_ref
var offset:Vector2
var initialPos:Vector2

@export var label_text:String = "Label";

@onready var label: Label = $PanelContainer/ColorRect/Label
@onready var panel_container: PanelContainer = $PanelContainer
@onready var area_2d: Area2D = $Area2D

func _ready() -> void:
	label.text = label_text
	area_2d.mouse_entered.connect(_on_area_2d_mouse_entered)
	area_2d.mouse_exited.connect(_on_area_2d_mouse_exited)
	area_2d.body_entered.connect(_on_area_2d_body_entered)
	area_2d.body_exited.connect(_on_area_2d_body_exited)

func _process(delta: float) -> void:
	if draggable:
		if Input.is_action_just_pressed("MouseClick"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			global.is_dragging = true
		if Input.is_action_pressed("MouseClick"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("MouseClick"):
			global.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_droppable:
				tween.tween_property(self, "position", body_ref.global_position,0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self, "global_position", initialPos,0.2).set_ease(Tween.EASE_OUT)

func _on_area_2d_mouse_entered():
	if not global.is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited():
	if not global.is_dragging:
		draggable = false
		scale = Vector2(1, 1)

func _on_area_2d_body_entered(body:StaticBody2D):
	if body.is_in_group("droppable"):
		print(body.global_position)
		is_inside_droppable = true
		body_ref = body
		body.modulate = Color(Color.GREEN_YELLOW, 1.0)

func _on_area_2d_body_exited(body:StaticBody2D):
	if body.is_in_group("droppable"):
		is_inside_droppable = false
		body.modulate = Color(Color.ORANGE, 1.0)
