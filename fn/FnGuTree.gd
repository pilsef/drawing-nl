extends FnGu

class_name FnGuTree

@export var rq_gu_parent : Fn
@export var arr_rq_gu_children : Array

func exec():
	#var rq_hat = box(Color.DARK_RED, Vector2(1, 10))
	#var rq_children = chained(arr_rq_gu_children, Pos.TOP_RIGHT, Dir.DOWN_RIGHT, Vector2(10, 0))
	#rq_children = bordered(Color.DARK_RED, -1, rq_children)
	#return chained([rq_gu_parent, rq_hat, rq_children], Pos.BOTTOM_MIDDLE, Dir.DOWN).exec()
	
	var rq_children = chained(arr_rq_gu_children, Pos.TOP_RIGHT, Dir.DOWN_RIGHT, Vector2(10, 0))
	var gu_children:Guber = rq_children.exec()
	var arr_pos = []
	
	for subtree:Guber in gu_children.get_children():
		var pos = subtree.get_pt(Pos.TOP_MIDDLE)
		var root_subtree = subtree.get_child(subtree.get_child_count() - 1)
		if root_subtree is Guber && root_subtree.is_in_group("parents"):
			pos = subtree.position + root_subtree.get_pt(Pos.TOP_MIDDLE)
			#root_subtree.modulate = Color(0,1,0,0.5)
		var gu_box : Guber = box(Color.DARK_RED, Vector2(1,5)).exec()
		gu_children.place(gu_box, pos, Dir.UP)
		arr_pos.append(gu_box.get_pt(Pos.TOP_LEFT))
		
	var pts = [arr_pos[0], arr_pos[-1]]
	var width_hat = max(1, pts[1].x - pts[0].x + 1)
	
	var rq_hat = box(Color.DARK_RED, Vector2(width_hat, 1))
	var gu_hat : Guber = rq_hat.exec()
	var gu_box : Guber = box(Color.DARK_RED, Vector2(1,5)).exec()
	gu_hat.place_rel(gu_box, Pos.TOP_MIDDLE, Dir.UP)
	
	gu_children.place(gu_hat, pts[0], Dir.UP_RIGHT)
	var pos_middle_of_hat = gu_hat.get_pt(Pos.TOP_MIDDLE)
	
	var gu_parent:Guber = rq_gu_parent.exec()
	gu_parent.add_to_group("parents")
	gu_children.place(gu_parent, pos_middle_of_hat, Dir.UP)
	
	return gu_children
