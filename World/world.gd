extends Node2D

@onready var killzone: Area2D = $Killzone

func _on_killzone_body_entered(body: Node2D) -> void:
	if body.is_in_group("Players"):
		get_tree().reload_current_scene.call_deferred()
