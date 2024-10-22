#extends RefCounted
#
#class_name Revertible
#
#var operations = []
#
#func operation_append(inst, method, args):
	#operations.append([funcref(inst, method), args])
	#
#func revert():
	#while (!operations.is_empty()):
		#var next = operations.pop_back()
		#var fref:FuncRef = next[0]
		#fref.call_funcv(next[1])
#
#func create(clazz):
	#return did_create(clazz.new())
	#
#func did_create(obj):
	#operation_append(obj, "queue_free", [])
	#return obj
	#
#func branch(script_rev = get_script()):
	#var rev = script_rev.new() # no need to queue_free since reference
	#operation_append(rev, "revert", [])
	#return rev
#
#func add_child(parent, child):
	#parent.add_child(child)
	#operation_append(parent, "remove_child", [child])
	#
#func remove_child(child:Node):
	#var parent = child.get_parent()
	#parent.remove_child(child)
	#operation_append(parent, "add_child", [child])
	#
#func did_add_child(parent, child):
	#operation_append(parent, "remove_child", [child])
	#
#func swap_child(child_old, child_new):
	#var parent:Node = child_old.get_parent()
	#parent.add_sibling(child_old, child_new)
	#parent.remove_child(child_old)
#
	#operation_append(parent, "remove_child", [child_new])
	#operation_append(parent, "add_sibling", [child_new, child_old])
#
#func set_property(inst, prop, val):
	#operation_append(inst, "set", [prop, inst.get(prop)])
	#inst.set(prop, val)
	#
#func conn(inst:Object, signl, target, method, arr_binds = []):
	#operation_append(inst, "disconnect", [signl, target, method])
## warning-ignore:return_value_discarded
	#inst.connect(signl, Callable(target, method).bind(arr_binds))
