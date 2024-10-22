extends Fn

class_name FnGuChainPaddedScaledText

@export var arr_text : Array[String]

@export var arr_rq_hierarchy : Array[Fn]
@export var rq_root : Fn

func exec():
	
	var rq_chain = FnGuChain.new()

	for txt in arr_text:
		var rq_gu = padded_lr(20, 20,
			scaled(2,
				textd(txt)
			)
		)
		rq_chain.arr_rq_gu.append(rq_gu)
		
	return rq_chain.exec()

func padded_lr(left:int, right:int, rq_gu:Fn) -> Fn:
	var rq_gu_padded = FnGuPadded.new()
	rq_gu_padded.left_top.x = left
	rq_gu_padded.right_bottom.x = right
	rq_gu_padded.rq_gu = rq_gu
	return rq_gu_padded

func scaled(scale:int, rq_gu:Fn) -> Fn:
	var rq_gu_scaled = FnGuScaled.new()
	rq_gu_scaled.scale = scale
	rq_gu_scaled.rq_gu = rq_gu
	return rq_gu_scaled

func textd(txt:String) -> Fn:
	var rq_gu_atlas = FnGuFromTextd.new()
	rq_gu_atlas.txt = txt
	return rq_gu_atlas
