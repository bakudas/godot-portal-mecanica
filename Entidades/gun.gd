extends StaticBody2D

var bullet = preload("res://Entidades/Bullet2D.tscn")
onready var root = get_tree().root
export (int) var azul_count = 1
export (int) var laranja_count = 1


func _process(delta):
	
	look_at(get_global_mouse_position())
	if azul_count > 0:
		if Input.is_action_just_pressed("atirar"):
			shoot("azul")
			azul_count -= 1
	
	if laranja_count > 0 and azul_count == 0:
		if Input.is_action_just_pressed("atirar2"):
			shoot("laranja")
			laranja_count -= 1


func shoot(type):
	var b = bullet.instance()
	
	match type:
		"azul":
			b.tipo = b.tipo_tiro.azul

		"laranja":
			b.tipo = b.tipo_tiro.laranja

	root.add_child(b)
	
	b.transform = $muzzle.global_transform
	

