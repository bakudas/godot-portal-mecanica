tool
extends Node2D

class_name Obj_portal

enum enum_tipo_portal {azul, laranja}
var tipo_portal

export (Color) var cor #var exposta para editar visualmente no editor

#next_portal Node2D para ter infos de Transform (Vector2)
var next_portal:Node2D setget set_next_portal, get_next_portal
var temp_next_portal:Node2D


#func _init(tipo):
#	tipo_portal = tipo


func _enter_tree():
	$TXT_self.text = self.name
#	print(get_tree().get_nodes_in_group("PortalAzul")[0])
#	print(get_tree().get_nodes_in_group("PortalLaranja")[0])


func update_tipo_portal(enum_tipo_portal):
	tipo_portal = enum_tipo_portal


func _process(delta):
	
	# mudar a cor no editor, para facilitar a visualização
	if Engine.editor_hint: 
		$ColorRect.color = cor


#portal collider and check player entered
func _on_Area2D_body_entered(body):

	if is_in_group("PortalAzul"):
		
		# check player 
		if body.is_in_group("Player"):
			if body.can_teleport_to_blue:
				# evita que ative o próximo portal
				body.can_teleport_to_blue = false 
				
				# teleport
				if get_tree().get_nodes_in_group("PortalLaranja")[0].position != null: 
					body.position = get_tree().get_nodes_in_group("PortalLaranja")[0].position
	
	if is_in_group("PortalLaranja"):
		# check player 
		if body.is_in_group("Player"):
			if body.can_teleport_to_orange:
				# evita que ative o próximo portal
				body.can_teleport_to_orange = false 
				
				# teleport
				if get_tree().get_nodes_in_group("PortalAzul")[0].position != null: 
					body.position = get_tree().get_nodes_in_group("PortalAzul")[0].position


# garantir que possa teleportar depois de sair de cima do portal
func _on_Area2D_body_exited(body):
	
	if is_in_group("PortalAzul"):
		if body.is_in_group("Player"):
			body.can_teleport_to_orange = true 

	if is_in_group("PortalLaranja"):
		if body.is_in_group("Player"):
			body.can_teleport_to_blue = true 
	pass


func set_next_portal(ref_next_port) -> void:
	pass


func get_next_portal() -> Node2D:
	return next_portal


#update labels portais
func update_labels() -> void:
	if is_in_group("PortalAzul"):
		$TXT_self.text = get_tree().get_nodes_in_group("PortalAzul")[0].name
		$TXT_go_to.text = "go-to: " + get_tree().get_nodes_in_group("PortalLaranja")[0].name
			

	if is_in_group("PortalLaranja"):
		$TXT_self.text = get_tree().get_nodes_in_group("PortalLaranja")[0].name
		$TXT_go_to.text = "go-to: " + get_tree().get_nodes_in_group("PortalAzul")[0].name


func muda_cor(cor):
	$ColorRect.color = cor

