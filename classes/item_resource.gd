extends Resource

class_name ItemResource

enum Tool {
	NONE,
	PICKAXE,
	AXE,
	SWORD,
	SHOVEL,
	HOE,
	ALL
}

@export var max_stack_size: int = 64
@export var max_durability: int = -1
@export var breaking_tier: int = 0
@export var texture: Texture = preload("res://icon.svg")
@export var tool_type: Tool = Tool.NONE
@export var id: String = "undefined"

func  _init(i_tex: Texture = preload("res://icon.svg"), i_dur: int = -1, i_br: int = 0, i_tool = Tool.NONE, i_stack_size: int = 64, i_id: String = "undefined"):
	max_stack_size = i_stack_size
	max_durability = i_dur
	breaking_tier = i_br
	texture = i_tex
	tool_type = i_tool
	id = i_id
