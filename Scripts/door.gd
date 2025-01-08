extends Area2D
@onready var door_closed: Sprite2D = $door_closed
@onready var door_open: Sprite2D = $door_open

func _ready():
	door_closed.visible = true
	door_open.visible = false

func open_door():
	door_closed.visible = false
	door_open.visible = true
	
