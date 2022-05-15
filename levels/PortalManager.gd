tool
extends Node2D

export (Array, Array, NodePath) var lista_portais

func _ready():
	
	print("PORTAL MANAGER:")
	print("LISTA DE PORTAIS:")
	print("----------------")
	print("")
	
	for portal in lista_portais:
		print("portal: " + portal[0])
		var cur_portal = get_node(portal[0])
		
		print("vai para: " + portal[1])
		var next_portal = get_node(portal[1])
		
		print("----------------")
		
		cur_portal.next_portal = next_portal
