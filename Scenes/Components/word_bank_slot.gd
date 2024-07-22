extends Control

@onready var collision_shape_2d: CollisionShape2D = $StaticBody2D/CollisionShape2D
@onready var static_body_2d: StaticBody2D = $StaticBody2D

func _ready() -> void:
	#var rect = RectangleShape2D.new()
	#rect.size = custom_minimum_size
	#collision_shape_2d.shape = rect
	#static_body_2d.position = Vector2(rect.size.x/2, rect.size.y/2)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if global.is_dragging:
		#visible = true
	#else:
		#visible = false
	pass
