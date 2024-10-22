extends Fn

class_name FnGuFromTexCell

@export var tex: Texture2D

@export var size_cell: Vector2
@export var coords_cell: Vector2

func exec():
	
	var atlas_tex = AtlasTexture.new()
	atlas_tex.atlas = tex
	atlas_tex.region = Rect2(coords_cell * size_cell, size_cell)
	
	var rq_gu = FnGuFromTex.new()
	rq_gu.tex = atlas_tex
	
	return rq_gu.exec()
