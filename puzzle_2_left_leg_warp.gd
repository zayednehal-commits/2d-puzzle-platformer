extends Area2D


@export var warpIndex = 0
static var warps = []
static var warps_encountered = 0
var isCollected = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if len(warps) > 0:
		if not is_instance_valid(warps[0]):
			warps = []
			warps_encountered = 0
	
	warps.append(self)
	
	if warpIndex == 4:
		self.move_local_y(-100000)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D" and not isCollected:
		#if warpIndex == 0:
			##body.move_local_x(1000)
			#body.move_local_y(-225)
		#elif warpIndex == 1:
			#body.move_local_x(-200)
			#body.move_local_y(0)
			#
		#elif warpIndex == 2:
			#body.move_local_x(200)
			#body.move_local_y(0)
		#
		#elif warpIndex == 3:
			#body.move_local_x(400)
			#body.move_local_y(400)
			
		if warpIndex == 4:
			get_tree().change_scene_to_file("res://scenes/Left_Arm.tscn")
		
		warps_encountered += 1
		isCollected = true
		print(warps_encountered)
		if warps_encountered >= 4:
			warps[4].move_local_y(100000)
		
