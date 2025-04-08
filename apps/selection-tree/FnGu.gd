extends FnGu

#var grid:Node
var cursor:CursorTree

func exec():
	#return render_grid(cursor.nd.get_grandparent()).exec()
	
	var name_char = cursor.rs.name
	var rq_name = scaled(2, textd(name_char))
	
	return decorated([
		padgrounded_a(Color.WHITE, 6),
		bordered(Color.BLACK, 12),
		scaled(3),
		with(rq_name, Pos.BOTTOM_MIDDLE, Dir.UP, Vector2(0, -10))
	], render(cursor.nd.get_root())).exec()
	
	
func render(nd):
	
	var rq = img(nd.rs.tex)
	if nd == cursor.nd:
		rq = bordered(Color.RED, -2, rq)
	
	var rq_hat = box(Color.DARK_RED, Vector2(1, 4))
	if !nd.is_root():
		rq = chained([rq, rq_hat], Pos.TOP_MIDDLE, Dir.UP)
	
	if !nd.is_leaf():
		var arr_rq_children = nd.get_children().map(render)
		var rq_children = chained(arr_rq_children, Pos.RIGHT_MIDDLE, Dir.RIGHT, Vector2(10, 0))
		rq_children = bordered(Color.DARK_RED, -1, rq_children)
		rq = chained([rq, rq_hat, rq_children], Pos.BOTTOM_MIDDLE, Dir.DOWN)
	
	return rq
	
#func render_grid(grid:Node):
	#var rq_children = gridded_2(grid, render_char)
	#
	#var name_char = cursor.rs.name
	#var rq_name = scaled(2, textd(name_char))
	#
	#return decorated([
		#padgrounded_a(Color.LIGHT_GRAY, 3),
		#bordered(Color.BLACK, 10),
		#scaled(3),
		#with(rq_name, Pos.BOTTOM_MIDDLE, Dir.UP, Vector2(0, -6))
	#], rq_children)
	#
#func render_char(node):
	#
	#var rq = img(node.rs.tex)
	#
	#if node == cursor.nd:
		#rq = decorated([
			#padgrounded_a(Color.WHITE, 2),
			#bordered(Color.DARK_RED, 2),
			#scaled(1.2)
		#], rq)
	#
	#return embedded(Vector2(30,30), Pos.MIDDLE, Dir.NONE, Vector2(), rq)

	
#static func get_class_name(node:Node):
	#var scr:Script = node.get_script()
	#while scr != null:
		#if scr.get_global_name() != "":
			#return scr.get_global_name()
		#scr = scr.get_base_script()
	#return node.get_script().get_instance_base_type()
