extends Node

@onready var slides:Array[Node2D] = []
@onready var slide_container: Node2D = $Container/SlideContainer
@onready var animation_player:AnimationPlayer = $AnimationPlayer
@onready var currentSlide:int = 0

func _ready() -> void:
	%VHS.visible = true
	
	for slide in slide_container.get_children():
		slides.append(slide)
	
	for slide in slides.size():
		if slide == currentSlide:
			slides[slide].visible = true
		else:
			slides[slide].visible = false

func _process(delta):
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
