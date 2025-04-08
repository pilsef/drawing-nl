extends Resource

class_name CursorTree

var nd : Nd

#var data : Resource :
	#get: return nd.data

var rs : Resource :
	get: return nd.rs
	
func _init(nd : Nd):
	self.nd = nd

func surface(amt = 1):
	if nd.get_parent() == null:
		return
	
	for i in amt:
		nd = nd.get_parent()

func delve(amt = 1):
	if nd.get_child_count() == 0:
		return
	
	for i in amt:
		nd = nd.get_child(0)

func shift(amt):
	nd = nd.get_sibling(amt)

func migrate(amt):
	nd = nd.get_cousin_match_idx(amt)
	
