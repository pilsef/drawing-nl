extends Node2D

var guber = Guber.new()
var origin = Vector2(512,100)

func _init():
	guber.position = origin
	add_child(guber)
	
	var rq = load("res://rq_gu_from_lightswitch_test.tres")
	guber.place(rq.exec(), Vector2(0,0), Vector2.DOWN)
	
#	var rq = FnGuFromRq.new()
#	rq.rq = load("res://rq_gu_chain_test.tres")
#	guber.place(rq.exec(), Vector2(0,0), Vector2.DOWN)

#	var rq_chain = load("res://rq_gu_chain_test.tres")
#	guber.place(rq_chain.exec())
#	guber.place(create_img(load("res://icon.png")))
	add_child(create_pixel_at(origin))

func create_pixel_at(pos):
	var r = ColorRect.new()
	r.rect_min_size = Vector2(1,1)
	r.color = Color.red
	r.rect_position = pos
	return r
	
func create_img(tex):
	var rqGu = FnGuFromImg.new()
	rqGu.tex = tex
	return rqGu.exec()

func create_label(txt):
	var rqGu = FnGuFromStr.new()
	rqGu.txt = txt
	return rqGu.exec()
