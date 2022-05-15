extends Area2D

enum tipo_tiro {azul, laranja}

onready var root = get_tree().root

var portal = preload("res://Entidades/Portal.tscn")
var portal_laranja
var portal_azul

var speed:float = 200
var tipo


func _enter_tree():
	match tipo:
		tipo_tiro.azul:
			muda_cor("#0085f0")
			print('azul')

		tipo_tiro.laranja:
			muda_cor("#f05400")
			print('laranja')


func muda_cor(cor):
	$ColorRect.color = cor
	get_node("")


func _physics_process(delta):
	position += transform.x * speed * delta


func _on_Bullet2D_body_entered(body):
	if body.is_in_group("Paredes"):
		match tipo:
			tipo_tiro.azul:
#				var temp_portal_azul = Obj_portal.new(tipo_tiro.azul, '#0085f0')
				var temp_portal_azul = portal.new(tipo_tiro.azul, '#0085f0')
				root.add_child(temp_portal_azul)
				print(temp_portal_azul.name)
				temp_portal_azul.transform = global_transform
				print(temp_portal_azul.position)
#
#				temp_portal_azul.update_tipo_portal(tipo_tiro.azul)
				pass
				
				
			tipo_tiro.laranja:
				var temp_portal_azul = Obj_portal.new(tipo_tiro.laranja, "#f05400")
#				var temp_portal_laranja
#				temp_portal_laranja = portal.instance()
#
#				root.add_child(temp_portal_laranja)
#				temp_portal_laranja.transform = global_transform
#				temp_portal_laranja.update_tipo_portal(tipo_tiro.laranja)
				pass



		queue_free()

