class_name CollectableComponent
extends Area2D

@export var collectable_name: String


func _on_body_entered(body: Node2D) -> void:
	#print("Collided")
	InventoryManager.add_collectable(collectable_name)
	if body is Player:
		print("Collected: ", collectable_name)
		get_parent().queue_free()
