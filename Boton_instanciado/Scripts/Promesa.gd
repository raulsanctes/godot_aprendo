extends Area2D

signal promesa_cumplida

func _on_Promesa_body_entered(body):
	if body.get_name() == "player":
		emit_signal("promesa_cumplida")
		self.queue_free()
