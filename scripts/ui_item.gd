extends Control

@export var item: ItemStack

@onready var texture_node: Control = TextureRect.new()
@onready var stack_node: Control = Label.new()
@onready var dura_node: Control = ProgressBar.new()

var old_item: ItemStack
func _ready():
	texture_node.size = Vector2(Global.TILE_SIZE, Global.TILE_SIZE)
	add_child(texture_node)
	add_child(stack_node)
	add_child(dura_node)
	
func _process(delta):
	if item != old_item:
		print(item.material.id)
		old_item = item
		if item == null:
			visible = false
		else:
			visible = true
			texture_node.texture = item.material.texture
			stack_node.text = str(item.stack) if item.stack > 1 else ""
			if item.material.max_durability == item.durability or item.material.max_durability == -1:
				dura_node.visible = false
			else:
				dura_node.visible = true
				dura_node.max_value = item.material.max_durability
				dura_node.value = item.durability
				dura_node.modulate = Color.from_hsv((1-(item.durability / item.material.max_durability)) * 120, 1.0, 1.0) 
