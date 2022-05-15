tool
extends Node2D

class_name Obj_portal

enum enum_tipo_portal {azul, laranja}
var tipo_portal

export (Color) var cor #var exposta para editar visualmente no editor

#next_portal Node2D para ter infos de Transform (Vector2)
var next_portal:Node2D setget set_next_portal, get_next_portal
var temp_next_portal:Node2D


func _init(tipo, color):
	tipo_portal = tipo
	cor = color
pass


#func _enter_tree():
#	update_tipo_portal(tipo_portal)
##	muda_cor(cor) #set color to portal
#	set_next_portal(temp_next_portal)
#	update_labels(self.name, next_portal)


func update_tipo_portal(tipo_tiro):
	tipo_portal = tipo_tiro


func _process(delta):
	
	# mudar a cor no editor, para facilitar a visualização
	if Engine.editor_hint: 
		$ColorRect.color = cor


#portal collider and check player entered
func _on_Area2D_body_entered(body):
	
	# check player 
	if body.is_in_group("Player"):
		if body.can_teleport:
			# evita que ative o próximo portal
			body.can_teleport = false 
			
			# teleport
			if next_portal.position != null: 
				body.position = next_portal.position


# garantir que possa teleportar depois de sair de cima do portal
func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		body.can_teleport = true 


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

