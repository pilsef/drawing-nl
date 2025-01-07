extends Fn

class_name FnGuFromTextMultiline

@export var rq_fontdict: Fn = load("res://rq/rq_fontdict_from_tex_pico.tres")
@export var txt = "default text"
@export var line_len_max : int = 16
@export var line_spacing = 4
@export var align = ALIGN.LEFT

enum ALIGN { LEFT , CENTER, RIGHT }

func exec():
	var rq_gu_chain = FnGuChain.new()
	
	match align:
		ALIGN.LEFT:
			rq_gu_chain.pos_next_rel = Pos.BOTTOM_LEFT
			rq_gu_chain.dir_next = Dir.DOWN_RIGHT
		ALIGN.CENTER:
			rq_gu_chain.pos_next_rel = Pos.BOTTOM_MIDDLE
			rq_gu_chain.dir_next = Dir.DOWN
		ALIGN.RIGHT:
			rq_gu_chain.pos_next_rel = Pos.BOTTOM_RIGHT
			rq_gu_chain.dir_next = Dir.DOWN_LEFT
	
	rq_gu_chain.offset = Vector2(0, line_spacing)
	
	var arr_lines = TextUtil.break_into_lines(txt, line_len_max)
	
	for str_line in arr_lines:
		var rq_gu_line = create_rq_gu_line(str_line)
		rq_gu_chain.arr_rq_gu.append(rq_gu_line)
		
	return rq_gu_chain.exec()

func create_rq_gu_line(string):
	if string == "":
		var rq_gu = FnGuFromColor.new()
		rq_gu.color = Color(0,0,0,0)
		rq_gu.size = Vector2(1,8) # todo: get from font
		return rq_gu
	else:
		var rq_gu_line = FnGuFromText.new()
		rq_gu_line.rq_fontdict = rq_fontdict
		rq_gu_line.txt = string
		return rq_gu_line
