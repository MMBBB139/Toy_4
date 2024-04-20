extends Node2D

var Game_On = false

func _process(delta):
	if Game_On == true:
		$Projectile.position.x += 1

func _on_button_pressed():
	Game_On = true
	$UI/Button.visible = false
	$UI/Node2D.visible = false
