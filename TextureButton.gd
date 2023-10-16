extends TextureButton

const dragPreview = preload("res://DragPreview.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _get_drag_data(position: Vector2):
	var slot = get_parent().get_name()
	
	var data = {}
	data["origin_node"] = self
	data["origin_slot"] = slot
	
	var dragPreview = dragPreview.instance()
	dragPreview.texture = texture_normal
	add_child(dragPreview)
	
	return data


func _can_drop_data(position, data):
	var target_slot = get_parent().get_name()
	data["target_texture_normal"] = texture_normal
	
	return true


func _drop_data(position, data):
	
	data["origin_node"].texture_normal = data["target_texture_normal"]
	
	texture_normal = data["origin_texture_normal"]
