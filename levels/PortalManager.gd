tool
extends Node2D

export (Array, Array, NodePath) var lista_portais
var cur_portal
var next_portal

func _ready():
	
	print("PORTAL MANAGER:")
	print("LISTA DE PORTAIS:")
	print("----------------")
	print("")
	
	for portal in lista_portais:
		print("portal: " + portal[0])
		cur_portal = get_node(portal[0])
		
		print("vai para: " + portal[1])
		next_portal = get_node(portal[1])
		
		cur_portal.update_labels(cur_portal.name, "go-to: " + next_portal.name)
		
		print("----------------")
		
		cur_portal.next_portal = next_portal


func _draw():
	
	for portal in lista_portais:
		cur_portal = get_node(portal[0])
		next_portal = get_node(portal[1])
		draw_line(cur_portal.position, next_portal.position, Color(255,255,255), 2, false)
	
	if Engine.editor_hint:
		for portal in lista_portais:
			cur_portal = get_node(portal[0])
			next_portal = get_node(portal[1])
			draw_line(cur_portal.position, next_portal.position, Color(255,255,255), 2, false)
