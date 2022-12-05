extends Resource

class_name Registry

var blocks       : Dictionary = {}
var block_ts_idxs: Dictionary = {}
var items        : Dictionary = {}
var entities     : Dictionary = {}
var loot_tables  : Dictionary = {}

func add_block(block: BlockResource):
	print("Adding block:")
	print("    ID: " + block.id)
	print("    Tool: " + str(block.p_tool))
	print("    Material: " + str(block.material))
	print("    Breaking Tier: " + str(block.breaking_tier))
	print("    Breaking Time: " + str(block.hardness))
	print("    Collision: ")
	for polygon in block.collision:
		print("        " + str(polygon))
	# Add to tileset
	block_ts_idxs[block.id] = Global.ts.add_source(TileSetAtlasSource.new())
	var src = Global.ts.get_source(block_ts_idxs[block.id])
	print("    Tileset ID: " + str(block_ts_idxs[block.id]))
	src.texture = block.texture
	src.texture_region_size = block.texture.get_size()
	src.create_tile(Vector2i.ZERO)
	var data = src.get_tile_data(Vector2i.ZERO, 0)
	data.set_collision_polygons_count(0, block.collision.size())
	var i = 0
	for polygon in block.collision:
		for n in range(polygon.size()):
			polygon.set(n, (polygon[n] * Global.TILE_SIZE) - Vector2(Global.TILE_SIZE / 2.0, Global.TILE_SIZE / 2.0))
		data.set_collision_polygon_points(0, i, polygon)
		i += 1

	add_item(ItemResource.new(block.texture, -1, 0, ItemResource.Tool.NONE, 64, block.id))
	if block.loot_table == "":
		add_loot_table(LootTable.new([block.id], [1.0], block.id))
		block.loot_table = block.id
	blocks[block.id] = block

func add_item(item: ItemResource):
	print("Adding item:")
	print("    ID: " + item.id)
	print("    Stack Density: " + str(item.max_stack_size))
	print("    Durability: " + str(item.max_durability))
	print("    Breaking Tier: " + str(item.breaking_tier))
	print("    Tool Type: " + str(item.tool_type))
	items[item.id] = item

func add_loot_table(loot_table: LootTable):
	print("Adding loot table:")
	print("    ID: " + loot_table.id)
	print("    Items:")
	for i in range(loot_table.choices.size()):
		print("        " + loot_table.choices[i] + ": " + str(loot_table.weights[i]))
	loot_tables[loot_table.id] = loot_table
