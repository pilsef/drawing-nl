extends Fn

class_name FnFontdictFromTex

@export var string_chars = " !\"#$%&'()*+,-./0123456789:;<=>?@" \
			+ "ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
@export var size_cell: Vector2
@export var tex: Texture2D

func exec():
	
	var fontdict = {}
	var num_cols = tex.get_width() / size_cell.x as int
	var idx_char = 0
	
	for char in string_chars:
		
		var idx_row = idx_char / num_cols
		var idx_col = idx_char % num_cols

		var atex_char = AtlasTexture.new()
		atex_char.atlas = tex
		atex_char.region = Rect2(size_cell * Vector2(idx_col, idx_row), size_cell)
		
		#var key = string_chars[idx_char]
		fontdict[char] = atex_char
		
		idx_char += 1
		
	return fontdict
