extends Fn

class_name FnAtlasDictFromTex

@export var iterable_wrapper: Array
@export var size_cell: Vector2
@export var tex: Texture2D

func exec():
	
	var dict = {}
	var num_cols = tex.get_width() / size_cell.x as int
	var idx_iterable = 0
	var iterable = iterable_wrapper[0]
	
	for item in iterable:
		
		var idx_row = idx_iterable / num_cols
		var idx_col = idx_iterable % num_cols

		var atlas_tex = AtlasTexture.new()
		atlas_tex.atlas = tex
		atlas_tex.region = Rect2(size_cell * Vector2(idx_col, idx_row), size_cell)
		
		var key = iterable[idx_iterable]
		dict[key] = atlas_tex
		
		idx_iterable += 1
		
	return dict


#  !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
