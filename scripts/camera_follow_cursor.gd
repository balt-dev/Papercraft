extends Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	offset = lerp(offset, $"../ForegroundLayer/Cursor".position, 1 - pow(0.05, delta * 4))
	var rect = get_viewport_rect()
	$"../BackgroundLayer/Sky".size = rect.size
	$"../BackgroundLayer/Sky".position = rect.position
	$"../CanvasLayer/UI".size = rect.size
	$"../CanvasLayer/UI".position = rect.position
