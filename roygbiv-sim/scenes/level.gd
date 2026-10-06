extends Node2D




func _on_van_body_entered(_body: Node2D) -> void:
	print("body entered")
	Global.player.can_move = false
	Global.player.velocity *= 0
