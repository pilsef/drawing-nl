extends Resource

class_name FnGuFromStr

export (String) var txt

func exec():

	var font = DynamicFont.new()
	font.font_data = load("res://FontHack.ttf")
#	font.size = 32
	
	var label = Label.new()
	label.set("custom_fonts/font", font)
	label.text = txt
	label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	
	var gu = Guber.new()
	gu.add_child(label)
	gu.bounds = Rect2(Vector2(0,0), font.get_string_size(txt))
	
	return gu
