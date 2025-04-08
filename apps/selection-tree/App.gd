extends AppBase

var num_cols = 3
var idx_selected = 0

func ld():
	#var arr_char = LoadUtil.load_resources_at("res://db/rs-character/")
	#arr_char = arr_char.map(nodify)
	
	#var grid = grid_from_arr(arr_char, num_cols)
	#iact.cursor = CursorTree.new(grid.get_grandchild(idx_selected))
	
	iact.cursor = CursorTree.new(build())

static func build():
	var root = c("sheep")
	
	var lvl_1 = [c("bear"), c("bee"), c("caterpillar")]
	for item in lvl_1:
		root.add_child(item)
	
	var lvl_2 = [
		[c("chameleon"), c("cow")], 
		[c("croc"), c("dall-sheep")], 
		[c("dragon"), c("fox")]
	]
	for i in lvl_2.size():
		for item in lvl_2[i]:
			root.get_child(i).add_child(item)
	
	var lvl_3 = [
		[c("mole"), c("monkey")], 
		[c("owl"), c("pelican")], 
		[c("polar-bear"), c("possum")], 
		[c("pufferfish"), c("rhino")], 
		[c("shark")], 
		[c("snake")]
	]
	for i in lvl_3.size():
		for item in lvl_3[i]:
			root.get_grandchild(i).add_child(item)
			
	return root
	
static func c(s):
	var char = load("res://db/rs-character/" + s + ".tres")
	return nodify(char)

#static func grid_from_arr(arr, num_cols):
	#var grid = Nd.new()
	#var row_curr
	#for i in arr.size():
		#if (i % num_cols == 0):
			#row_curr = Nd.new()
			#grid.add_child(row_curr)
		#row_curr.add_child(arr[i])
	#return grid

static func nodify(rs):
	var node = RsNode.new()
	node.rs = rs
	return node
	
class RsNode:
	extends Nd
	var rs
