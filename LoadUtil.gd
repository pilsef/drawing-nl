class_name LoadUtil

static func load_pngs_at(path:String) -> Array:
	return load_files_at_with_extension(path, ".png")

static func load_files_at_with_extension(path, extension) -> Array:
	var dir = DirAccess.open(path)
	if !dir:
		return []
		
	var arr = []

	for file in dir.get_files():
		if file.ends_with(extension):
			arr.append(load(path + file))
	
	return arr
