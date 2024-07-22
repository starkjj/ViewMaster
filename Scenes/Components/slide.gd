@tool
extends Node2D

@export var slide_image:Texture2D: set = _set_slide_texture

func _set_slide_texture(texture:Texture2D):
	$ClippingFrame/KitchenScene/SlideSprite.texture = texture
	slide_image = texture

func _ready() -> void:
	pass
