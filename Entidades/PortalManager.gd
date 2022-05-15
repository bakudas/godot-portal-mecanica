tool
extends Node2D

export (Array, Array, NodePath) var lista_portais
var cur_portal #portal base
var next_portal #portal alvo

func _ready():
	
	print("PORTAL MANAGER:")
	print("LISTA DE PORTAIS:")
	print("----------------")
	print("")
	
	## percorrer a lista de portais para realizar as atribuições
	#lista_portais = [(porta, portal), (portal,portal)]
	
	for portal in lista_portais:
		#como os indices funcionam
		#[0] - portal base
		#[1] - portal alvo
		
		#seta o portal inicial
		print("portal: " + portal[0])
		#get_node() é preciso 'transformar' o NodePath em Node2D
		cur_portal = get_node(portal[0])
		
		#seta o portal alvo
		print("vai para: " + portal[1])
		#get_node() é preciso 'transformar' o NodePath em Node2D
		next_portal = get_node(portal[1])
		
		#chama a função para atualizar os labels de cada portal
		cur_portal.update_labels(cur_portal.name, "go-to: " + next_portal.name)
		
		#atribui o próximo portal ao objeto portal
		cur_portal.set_next_portal(next_portal)
		
		print("----------------")


#desenha as linhas de debug
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
