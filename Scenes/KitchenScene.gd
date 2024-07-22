extends Node2D

@onready var vhs: ColorRect = %VHS

func _ready() -> void:
	vhs.visible = true;


func _on_carrot_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("MouseClick"):
		print("CLICKED!")
