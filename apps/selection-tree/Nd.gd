extends Node

class_name Nd

		
func is_leaf():
	return get_child_count() == 0
	
func is_root():
	return get_parent() == null

func get_root():
	var curr = self
	while curr.get_parent() != null:
		curr = curr.get_parent()
	return curr

func get_grandparent():
	return get_parent().get_parent()
	
func get_grandchild(idx):
	var arr_grandchildren = []
	for child in get_children():
		arr_grandchildren.append_array(child.get_children())
	return arr_grandchildren[idx]

func get_sibling(amt):

	var parent = get_parent()	
	if parent == null:
		return self
	
	var idx = get_index()
	var idx_next = posmod(idx + amt, parent.get_child_count())
	return parent.get_child(idx_next)

func get_cousin_match_idx(amt):
	var auncle = get_parent().get_sibling(amt)
	while get_index() >= auncle.get_child_count():
		auncle = auncle.get_sibling(sign(amt))
	
	return auncle.get_child(get_index())
