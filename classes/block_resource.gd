extends Resource

class_name BlockResource

enum BlockMaterial {
	STONE,
	GRASS,
	EARTH,
	WOOD
}

@export var texture: Texture = preload("res://icon.svg")
@export var hardness: float = 1.0
@export var p_tool: ItemResource.Tool = ItemResource.Tool.ALL
@export var breaking_tier: int = 0
@export var id: String = "undefined"
@export var collision: Array[PackedVector2Array] = [PackedVector2Array([Vector2(0, 0), Vector2(0, 1), Vector2(1, 1), Vector2(1, 0)])]
@export var loot_table: String = ""
@export var material: BlockMaterial = BlockMaterial.STONE

func  _init(i_tex: Texture = preload("res://icon.svg"), 
			i_hard: float = 1.0, 
			i_tool = ItemResource.Tool.ALL, 
			i_id: String = "undefined", 
			i_br_tier = 0, 
			i_collision = [PackedVector2Array([Vector2(0, 0), Vector2(0, 1), Vector2(1, 1), Vector2(1, 0)])],
			i_loot = ""):
	texture = i_tex
	hardness = i_hard
	p_tool = i_tool
	id = i_id
	breaking_tier = i_br_tier
	collision = i_collision
	loot_table = i_loot
