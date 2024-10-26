extends Fn

class_name FnGuChain2DNested

@export var arr_baselem = []
@export var class_baselem : GDScript
@export var rq_nested_template : Fn

@export var pos_1d = Pos.TOP_RIGHT
@export var dir_1d = Dir.DOWN_RIGHT

@export var pos_2d = Pos.BOTTOM_LEFT
@export var dir_2d = Dir.DOWN_RIGHT

@export var breadth_1d = 3

func exec():
	var rq_chain = FnGuChain2D.new()
	
	for baselem in arr_baselem:
		var rq_nested = FnGuChainNested.build_rq(baselem, class_baselem, rq_nested_template)
		rq_chain.arr_rq_gu.append(rq_nested)

	#rq_chain.pos_1d_next_rel = dir_to_pos_next_rel(dir_1d)
	#rq_chain.dir_1d_next = dir_1d
	#rq_chain.pos_2d_next_rel = dir_to_pos_2d_next_rel(dir_1d, dir_2d)
	#rq_chain.dir_2d_next = dir_to_dir_2d_next(dir_1d, dir_2d)
	rq_chain.pos_1d_next_rel = pos_1d
	rq_chain.dir_1d_next = dir_1d
	rq_chain.pos_2d_next_rel = pos_2d
	rq_chain.dir_2d_next = dir_2d

	rq_chain.breadth_1d = breadth_1d
	
	return rq_chain.exec()
	
#static func dir_to_pos_next_rel(dir:Vector2):
	#return (dir + Vector2(1,1)) * 0.5
#
#static func dir_to_dir_2d_next(dir_1d:Vector2, dir_2d:Vector2):	
	#match (dir_2d):
		#Vector2.LEFT, Vector2.RIGHT: return Vector2(dir_2d.x, dir_1d.y)
		#Vector2.UP, Vector2.DOWN: return Vector2(dir_1d.x, dir_2d.y)
		#
#static func dir_to_pos_2d_next_rel(dir_1d:Vector2, dir_2d:Vector2):
	#match (dir_2d):
		#Vector2.LEFT, Vector2.RIGHT: 
			#return (Vector2(dir_2d.x, -dir_1d.y) + Vector2(1,1)) * 0.5
		#Vector2.UP, Vector2.DOWN:
			#return (Vector2(-dir_1d.x, dir_2d.y) + Vector2(1,1)) * 0.5
