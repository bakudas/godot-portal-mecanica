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
#	update_tipo_portal(tipo_portal)
#	muda_cor(cor) #set color to portal
#	set_next_portal(temp_next_portal)


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
			body.can_teleport_to_blue = true 
			
	if is_in_group("PortalLaranja"):
		if body.is_in_group("Player"):
			body.can_teleport_to_orange = true 

func set_next_portal(ref_next_port) -> void:
	next_portal = ref_next_port
	#update_labels(self.name, ref_next_port.name)


func get_next_portal() -> Node2D:
	return next_portal


#update labels portais
func update_labels(var nome_portal, var nome_next_portal) -> void:
	$TXT_self.text = nome_portal
	if next_portal!=null:
		$TXT_go_to.text = nome_next_portal


func muda_cor(cor):
	$ColorRect.color = cor

