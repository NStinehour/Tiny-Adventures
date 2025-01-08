extends CanvasLayer
@onready var coins: Label = $Coins


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	coins.text = "Coins: " + str(Global.gotten_coins)
