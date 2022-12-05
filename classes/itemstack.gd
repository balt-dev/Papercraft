extends Node

class_name ItemStack

@export var material: ItemResource
@export var stack: int
@export var durability: int
@export var metadata: Dictionary

func _init(mat: ItemResource, s: int = 1, dur: int = -1, md: Dictionary = {}):
	material = mat
	stack = s
	durability = dur if dur != -1 else mat.max_durability
	metadata = md
