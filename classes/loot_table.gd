extends Resource

class_name LootTable

@export var choices: Array[String] = []
@export var weights: Array[float] = []
@export var id: String = "undefined"

func _init(i_choices: Array = [], i_weights: Array = [], i_id: String = "undefined"):
	choices = i_choices
	weights = i_weights
	id = i_id

func choose():
	var sum: float = 0
	for weight in weights:
		sum += weight
	var choice = Global.rng.randf_range(0, sum)
	var i = 0
	while weights[i] > choice:
		choice -= weights[i]
		i += 1
	return choices[i]
