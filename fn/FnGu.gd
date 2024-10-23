extends Fn

class_name FnGu

func exec():
	#print("implement me")
	
	return scaled(4, 
			 padded_h(20, 20,
			   #from_tex(load("res://tex/pufferfish.png")),
				from_textd("hello world")
			 ),
		   ).exec()

static func chain_nested(arr_baselem:Array, rq_base_template:Fn, rq_nested_template:Fn) -> Fn:
	var rq_chain = FnGuChainNested.new()
	rq_chain.rq_base_template = rq_base_template
	rq_chain.rq_nested_template = rq_nested_template
	return rq_chain

static func from_tex(tex:Texture) -> Fn:
	var rq_gu = FnGuFromTex.new()
	rq_gu.tex = tex
	return rq_gu
	
static func from_textd(txt:String) -> Fn:
	var rq_gu = FnGuFromTextd.new()
	rq_gu.txt = txt
	return rq_gu

static func padded(rq_gu:Fn, left = 0, right = 0, top = 0, bottom = 0) -> Fn:
	var rq_gu_padded = FnGuPadded.new()
	rq_gu_padded.left_top.x = left
	rq_gu_padded.left_top.y = top
	rq_gu_padded.right_bottom.x = right
	rq_gu_padded.right_bottom.y = bottom
	rq_gu_padded.rq_gu = rq_gu
	return rq_gu_padded

static func padded_h(left, right, rq_gu:Fn):
	return padded(rq_gu, left, right);

static func padded_v(top, bottom, rq_gu:Fn, ):
	return padded(rq_gu, 0, 0, top, bottom)

static func scaled(scale:int, rq_gu:Fn) -> Fn:
	var rq_gu_scaled = FnGuScaled.new()
	rq_gu_scaled.scale = scale
	rq_gu_scaled.rq_gu = rq_gu
	return rq_gu_scaled
