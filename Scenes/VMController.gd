extends Node

@export var slides:Array[SubViewportContainer] = []

@onready var animation_player:AnimationPlayer = $AnimationPlayer
@onready var label: Label = $Label
@onready var currentSlide:int = 0

func _ready() -> void:
	for slide in slides.size():
		if slide == currentSlide:
			slides[slide].visible = true
		else:
			slides[slide].visible = false

func _process(delta):
	label.text = str(currentSlide)
	
	if Input.is_action_pressed("NextSlide"):
		animation_player.play("NextSlide")
		

func next_slide():
	if currentSlide < slides.size()-1:
		currentSlide += 1
	elif currentSlide == slides.size()-1:
		currentSlide = 0
	
	for slide in slides.size():
		if slide == currentSlide:
			slides[slide].visible = true
		else:
			slides[slide].visible = false
