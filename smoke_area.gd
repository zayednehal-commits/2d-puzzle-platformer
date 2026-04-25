extends Node2D

@onready var collision = $Area2D/CollisionShape2D
@onready var animation = $AnimationPlayer
@export var required_switches = -1
var active_switches = 0
var is_active = true



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not animation.is_playing() and is_active:
		animation.play("main_gas")
		
	if active_switches >= required_switches and required_switches > 0:
		is_active = false
		collision.disabled = true
		animation.stop()
		$main_gas.hide()
		$back_gas.hide()


	
func _on_pressure_plate_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		active_switches += 1
