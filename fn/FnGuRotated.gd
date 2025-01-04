extends Fn

class_name FnGuRotated

@export var amt:float = 0
@export var rq_gu : Fn

func exec():
	var gu_base:Guber = rq_gu.exec()
	
	var gu = Guber.new()
	gu.place(gu_base, -gu_base.bounds.size * 0.5)
	
	var radians = deg_to_rad(amt)
	gu.rotate(radians)
	gu.bounds *= Transform2D(radians, Vector2())
	
	return gu
