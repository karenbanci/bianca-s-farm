extends Sprite2D

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent

var stone_scene = preload("res://scenes/object/rocks/stone.tscn")

func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.max_damage_reached.connect(on_max_damage_reached)
	
func on_hurt(hit_damage: int) -> void:
	print("hurt")
	$AnimationPlayer.play("hit")
	damage_component.apply_damage(hit_damage)
	await get_tree().create_timer(0.2).timeout
	material.set_shader_parameter("shake_intensity", 0.7)
	await get_tree().create_timer(0.2).timeout
	material.set_shader_parameter("shake_intensity", 0.0)
	
func on_max_damage_reached() -> void:
	print("max damage")
	call_deferred("add_stone_scene")
	queue_free()

func add_stone_scene() -> void:
	var stone_instance = stone_scene.instantiate() as Node2D
	stone_instance.global_position = global_position
	get_parent().add_child(stone_instance)
