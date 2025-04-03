extends FnGu

class_name FnGuCharacterSelection

#@export var tex_animal_selected = preload("res://tex/animals/pelican.png")
@export var rs_character_selected = preload("res://db/rs-character/pelican.tres")

func exec():

	var rq_grid_characters = get_rq_grid_characters()
	
	var rq_portrait = FnGuCharacterPortrait.new()
	rq_portrait.rs_character = rs_character_selected

	var rq_content_lower = chained_c(
		[rq_grid_characters, rq_portrait],
		Dir.RIGHT, Vector2(20,0)
	)
	
	var rq_content_upper = scaled(1.5, textd("CHOOSE YOUR CHARACTER!"))

	var rq_content = chained_c(
		[rq_content_upper, rq_content_lower],
		Dir.DOWN, Vector2(0, 10)
	)

	return decorated(
		[
			scaled(2),
			padgrounded_hv(Color.BLACK, 40, 50)
		],
		rq_content
	).exec()

func get_rq_grid_characters():
	var arr_characters = LoadUtil.load_resources_at("res://db/rs-character/")
	
	var func_character_to_rq = func(rs_character): 
		return get_rq_character(rs_character, rs_character_selected)
	
	var arr_rq_animals = arr_characters.map(func_character_to_rq)
	return gridded(arr_rq_animals, 5)

static func get_rq_character(rs_character, rs_character_selected):
	var rq_animal = FnGuCharacter.new()
	rq_animal.rs_character = rs_character
	rq_animal.is_selected = (rs_character == rs_character_selected)
	return rq_animal
