extends KinematicBody2D

#setup
const GRAVIDADE:float = 9.8
var jumping:bool = false
var speed:float = 250
var move:Vector2 = Vector2(0,0)
var can_teleport_to_blue:bool = false setget toggle_teleport_blue, get_teleport_blue
var can_teleport_to_orange:bool = false setget toggle_teleport_orange, get_teleport_orange


func toggle_teleport_blue(teleport=true):
	if can_teleport_to_blue:
		can_teleport_to_blue = false
	else:
		can_teleport_to_blue = teleport

	
func get_teleport_blue() -> bool:
	return can_teleport_to_blue


func toggle_teleport_orange(teleport):
	if can_teleport_to_orange:
		can_teleport_to_orange = false
	else:
		can_teleport_to_orange = teleport


func get_teleport_orange() -> bool:
	return can_teleport_to_orange


#controles
var direita:bool
var esquerda:bool


func _ready():
	
	pass


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

