extends Control

var label = load("res://Scenes/drag_label.tscn")

@export var word_list:Array[String]

@onready var word_bank: HFlowContainer = $VBoxContainer/WordBankMargin/WordBank

func _ready() -> void:
	pass
	for word in word_list:
		var new_label = label.instantiate()
		new_label.label_text = word
		word_bank.add_child(new_label)


func _process(delta: float) -> void:
	pass
