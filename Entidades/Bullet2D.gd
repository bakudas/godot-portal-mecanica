extends Area2D

enum tipo_tiro {azul, laranja}

onready var root = get_tree().root

var portal = preload("res://Entidades/Portal.tscn")
var portal_laranja
var portal_azul

var speed:float = 450
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


func _physics_process(delta):
	position += transform.x * speed * delta


func _on_Bullet2D_body_entered(body):
	if body.is_in_group("Paredes"):
		
		match tipo:
			tipo_tiro.azul:
				var temp_portal_azul = portal.instance()
				root.add_child(temp_portal_azul)
				
				temp_portal_azul.get_child(1).color = "#0085f0"
				temp_portal_azul.transform = global_transform
				temp_portal_azul.add_to_group("PortalAzul")
				
				get_tree().call_group("PortalManager", "update_portal_azul")
				get_tree().call_group("Player", "toggle_teleport_blue")

				
			tipo_tiro.laranja:
				var temp_portal_laranja = portal.instance()
				root.add_child(temp_portal_laranja)
				
				temp_portal_laranja.get_child(1).color = "#f05400"
				temp_portal_laranja.transform = global_transform
				temp_portal_laranja.add_to_group("PortalLaranja")
				
				get_tree().call_group("PortalManager", "update_portal_laranja")

		queue_free()

