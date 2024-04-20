extends RigidBody2D

static var Game_Start = false
var Player_Pos = Vector2(576, 324)
var mob_speed = 50
static var score = 0

func spawn():
	var random = RandomNumberGenerator.new()
	random.randomize()
	var mob_spawn = false
	var pos
	while not mob_spawn:
		pos = Vector2(random.randi_range(0, 1152),random.randi_range(0, 648))
		if ((Player_Pos - pos).length()) > 250:
			position = pos
			mob_spawn = true
	look_at(Player_Pos)
	

func _physics_process(delta):
	if Game_Start:
		position = position.move_toward(Player_Pos, delta * mob_speed)

#Start
func _on_button_pressed():
	Game_Start = true

#When enemy hits
func _on_area_2d_area_entered(area):
	if area.name == "ProjectileArea":
		$AudioStreamPlayer2D.play()
		spawn()
		mob_speed += 5
		score += 1
		$"../UI/Label".set_text("Score: " + str(score))
	elif area.name == "Player Area":
		$"../UI/Node2D".visible = true
		$"../UI/Button2".visible = true
		$"../UI/Button2/Panel/Label2".set_text("Score: " + str(score))
		Game_Start = false

#Restart
func _on_button_2_pressed():
	mob_speed = 50
	score = 0
	$"../UI/Label".set_text("Score: " + str(score))
	spawn()
	Game_Start = true
	$"../UI/Node2D".visible = false
	$"../UI/Button2".visible = false
