extends CharacterBody2D

var projectile_speed = 1000
var projectile = preload("res://projectile.tscn")
var Game_Start = false

func fire():
	if Game_Start and not $"../UI/Button2".visible:
		var projectile_instance = projectile.instantiate()
		projectile_instance.position = get_global_position()
		projectile_instance.rotation = rotation_degrees
		projectile_instance.apply_central_impulse(Vector2(-(projectile_speed), 0).rotated(rotation-PI))
		get_tree().get_root().call_deferred("add_child", projectile_instance)

func _ready():
	$Timer.start()

func _physics_process(delta):
	if Game_Start:
		look_at(get_global_mouse_position())

#Start
func _on_button_pressed():
	Game_Start = true

func _on_timer_timeout():
	fire()
