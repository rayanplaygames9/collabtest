extends Node2D

@onready var killzone: Area2D = $Killzone

func _on_killzone_body_entered(body: Node2D) -> void:
	if body.is_in_group("Players"):
		var player_respawn_timer = body.get_node_or_null("RespawnTimer")
		player_respawn_timer.start()
