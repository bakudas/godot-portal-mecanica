tool
extends Node2D

export (Color) var cor #var exposta para editar visualmente no editor

#next_portal Node2D para ter infos de Transform (Vector2)
var next_portal:Node2D setget set_next_portal, get_next_portal


func _ready():
	$ColorRect.color = cor #set color to portal


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


func get_next_portal() -> Node2D:
	return next_portal


#update labels portais
func update_labels(var nome_portal, var nome_next_portal) -> void:
	$TXT_self.text = nome_portal
	$TXT_go_to.text = nome_next_portal
