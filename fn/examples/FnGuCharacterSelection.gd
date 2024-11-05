extends FnGu

class_name FnGuCharacterSelection

@export var tex_animal_selected = preload("res://tex/animals/pelican.png")

func exec():
	
	var arr_tex_animals = LoadUtil.load_pngs_at("res://tex/animals/")
	
	var arr_rq_animals = []
	for tex_animal in arr_tex_animals:
		var rq_animal = get_rq_animal(tex_animal, tex_animal_selected)
		arr_rq_animals.append(rq_animal)
	
	var rq_animals = chained_rq_2d(arr_rq_animals, 5)
	
	var name = tex_animal_selected.resource_path.get_file().get_basename()
	var rq_portrait = decorated(
		[
			scaled(3),
			padgrounded_hv(Color.DEEP_SKY_BLUE, 10, 20),
			padgrounded_a(Color.WHITE, 4),
			with(textd(name), Pos.BOTTOM_MIDDLE, Dir.DOWN, Vector2(0,10)),
			backgrounded(Color.BLACK)
		], 
		img(tex_animal_selected)
	)

	var rq_content_lower = chained_rq(
		[rq_animals, space_h(20), rq_portrait],
		Pos.RIGHT_MIDDLE, Dir.RIGHT
	)
	
	var rq_content_upper = scaled(1.5, textd("CHOOSE YOUR CHARACTER!"))

	var rq_content = chained_rq(
		[rq_content_upper, space_v(10), rq_content_lower],
		Pos.BOTTOM_MIDDLE, Dir.DOWN
	)

	return decorated(
		[
			scaled(2),
			padgrounded_hv(Color.BLACK, 40, 50)
		],
		rq_content
	).exec()

static func get_rq_animal(tex_char, tex_char_selected):	
	var color_primary
	var color_secondary

	if (tex_char == tex_char_selected):
		color_primary = Color.SKY_BLUE
		color_secondary = Color.WHITE
	else:
		color_primary = Color.YELLOW_GREEN
		color_secondary = Color.DARK_GREEN
		
	return decorated(
		[
			padgrounded_a(color_primary, 8),
			padgrounded_a(color_secondary, 4),
			padded_a(8)
		],
		img(tex_char)
	)
