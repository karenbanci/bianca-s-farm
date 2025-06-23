extends PanelContainer

@onready var log_label: Label = $MarginContainer/VBoxContainer/Logs/LogLabel
@onready var stone_label: Label = $MarginContainer/VBoxContainer/Stone/StoneLabel
@onready var corn_label: Label = $MarginContainer/VBoxContainer/Corn/CornLabel
@onready var tomato_label: Label = $MarginContainer/VBoxContainer/Tomato/TomatoLabel
@onready var egg_label: Label = $MarginContainer/VBoxContainer/Egg/EggLabel
@onready var milk_label: Label = $MarginContainer/VBoxContainer/Milk/MilkLabel

func _ready() -> void:
	InventoryManager.inventory_changed.connect(on_inventory_changed)

	
func on_inventory_changed() -> void:
	var inventory: Dictionary = InventoryManager.inventory
	var labels = [log_label, stone_label, corn_label, tomato_label, egg_label, milk_label]
	var strings = ["log", "stone", "corn", "tomato", "egg", "milk"]
	
	for i in range(labels.size()):
		if inventory.has(strings[i]):
			labels[i].text = str(inventory[strings[i]])
