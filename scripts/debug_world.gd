extends Node2D

var index = 0
var selection = Vector2i(0, 0)
@onready var tiles = TileMap.new()
	
func _ready():
	tiles.cell_quadrant_size = Global.TILE_SIZE
	tiles.tile_set = Global.ts
	for n in range(Global.registry.blocks.size()):
		tiles.set_cell(0, Vector2i(n*2, 0), Global.registry.block_ts_idxs.values()[n], Vector2i(0, 0))
	$ForegroundLayer/Tiles.add_child(tiles, false)

func _process(delta):
	$ForegroundLayer/Cursor.position = lerp($ForegroundLayer/Cursor.position, (Vector2(selection) * Global.TILE_SIZE) + Vector2(Global.TILE_SIZE / 2.0, Global.TILE_SIZE / 2.0), 
	1 - pow(0.05, delta * 8))
	if Input.is_action_just_pressed("ui_up"):
		selection += Vector2i(0, -1)
	if Input.is_action_just_pressed("ui_down"):
		selection += Vector2i(0, 1)
	if Input.is_action_just_pressed("ui_left"):
		selection += Vector2i(-1, 0)
	if Input.is_action_just_pressed("ui_right"):
		selection += Vector2i(1, 0)
	if Input.is_action_just_pressed("ui_select"):
		index = (index + 1) % Global.registry.blocks.size()
		#$UILayer/UI/Hotbar/Item.item = ItemStack.new(Global.registry.items[Global.registry.blocks.values()[index].id])
	if Input.is_action_just_pressed("ui_accept"):
		tiles.set_cell(0, selection, Global.registry.block_ts_idxs.values()[index], Vector2i(0, 0))
	
