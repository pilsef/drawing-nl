extends Fn

class_name FnGuSized

@export var rq_gu : Fn
@export var size : Vector2

@export var pos = Pos.MIDDLE
@export var dir = Dir.NONE
@export var offset = Vector2()

func exec():
	var gu:Guber = rq_gu.exec()
	
	var scale_factor_x = size.x / gu.bounds.size.x;
	var scale_factor_y = size.y / gu.bounds.size.y;
	
	var rq_gu_scaled = FnGuScaled.new()
	rq_gu_scaled.rq_gu = gu.to_rq()
	rq_gu_scaled.scale = min(scale_factor_x, scale_factor_y)
	
	gu.queue_free()
	
	var rq_gu_embedded = FnGuEmbedded.new()
	rq_gu_embedded.rq_gu = rq_gu_scaled
	rq_gu_embedded.size = size
	rq_gu_embedded.pos = pos
	rq_gu_embedded.dir = dir
	rq_gu_embedded.offset = offset
	
	return rq_gu_embedded.exec()
