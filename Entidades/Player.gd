extends KinematicBody2D

#setup
const GRAVIDADE:float = 9.8
var jumping:bool = false
var speed:float = 250
var move:Vector2 = Vector2(0,0)
var can_teleport:bool = true


#controles
var direita:bool
var esquerda:bool


#inputs
func get_input() -> void:
	esquerda = Input.is_action_pressed("ui_left")
	direita = Input.is_action_pressed("ui_right")
	
	if direita:
		move.x = speed
	elif esquerda:
		move.x = -speed
	else:
		move.x = 0


func _process(delta):
	
	get_input() #get input
	
	#check floor
	if !is_on_floor():
		move.y += GRAVIDADE

	#method movement KinematicBody2D
	move_and_slide(move, Vector2.UP)

