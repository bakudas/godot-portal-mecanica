tool
extends Node2D

export (Color) var cor

var next_portal:Node2D


func _ready():
	$ColorRect.color = cor


func _process(delta):
	
	if Engine.editor_hint: # mudar a cor no editor, para facilitar a visualização
		$ColorRect.color = cor


func _on_Area2D_body_entered(body):
	
	if body.is_in_group("Player"):
		if body.can_teleport:
			body.can_teleport = false # evita que ative o próximo portal
			if next_portal.position != null: body.position = next_portal.position # teleport



func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		body.can_teleport = true # garantir que possa teleportar depois de sair de cima do portal


func update_labels(var nome_portal, var nome_next_portal) -> void:
	$TXT_self.text = nome_portal
	$TXT_go_to.text = nome_next_portal
