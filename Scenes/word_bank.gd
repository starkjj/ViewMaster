extends Control

var drag_label = preload("res://Scenes/drag_label.tscn")
var word_slot = preload("res://Scenes/Components/word_slot.tscn")

@export var word_list:Array[String]
@export_multiline var scene_sentance

@onready var word_bank: HFlowContainer = $VBoxContainer/WordBankMargin/WordBank
@onready var sentance_flow: HFlowContainer = $VBoxContainer/SentanceMargin/SentanceFlow

func _ready() -> void:
	pass
	for word in word_list:
		var new_label = drag_label.instantiate()
		new_label.text = word
		word_bank.add_child(new_label)
	
	generate_sentance()


func generate_sentance() -> void:
	for word in scene_sentance.split(" "):
		if word.contains("["):
			var new_word_slot = word_slot.instantiate()
			sentance_flow.add_child(new_word_slot)
		else:
			var word_label = Label.new()
			word_label.text = word
			sentance_flow.add_child(word_label)
