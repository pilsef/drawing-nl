extends FnGu # Fn

class_name FnGuGrid

@export var dir_1d = Dir.RIGHT
@export var dir_2d = Dir.DOWN
@export var breadth_1d = 3

@export var pos = Pos.MIDDLE
@export var dir = Dir.NONE

@export var arr_rq_gu = []

func exec():
	var num_rows = ceil(arr_rq_gu.size() as float / breadth_1d)
	var num_cols = breadth_1d
	
	# store gus in a matrix
	# make another matrix (of the same size) to hold dimensions
	var mx_gus = Matrix.create(num_rows, num_cols)
	var mx_dim = Matrix.create(num_rows, num_cols)
	
	initialize_matrices(mx_gus, mx_dim, num_cols)
	
	if dir_1d == Dir.UP || dir_1d == Dir.DOWN:
		# for each row, find the max width & update dimensions matrix
		calc_widths_by_row(mx_gus, mx_dim, num_rows, num_cols)
		# for each col, find the max height & update dimensions matrix
		calc_heights_by_col(mx_gus, mx_dim, num_rows, num_cols)
	else:
		# for each row, find the max height & update dimensions matrix
		calc_heights_by_row(mx_gus, mx_dim, num_rows, num_cols)
		# for each col, find the max width & update dimensions matrix
		calc_widths_by_col(mx_gus, mx_dim, num_rows, num_cols)
	
	# for each matrix item, look up dimensions & embed within those dimensions
	# (add the result to an array)
	var arr_rq_cells = generate_arr_rq_cells(mx_gus, mx_dim, num_rows, num_cols)
	
	# pass that array to FnGuChain2D (using logic to calculate pos/dir)
	return create_rq_grid(arr_rq_cells).exec()
	
func initialize_matrices(mx_gus, mx_dim, num_cols):
	for idx in arr_rq_gu.size():
		var idx_row:int = idx / num_cols
		var idx_col:int = idx % num_cols
		mx_gus[idx_row][idx_col] = arr_rq_gu[idx].exec()
		mx_dim[idx_row][idx_col] = Vector2()

static func calc_heights_by_row(mx_gus, mx_dim, num_rows, num_cols):
	for idx_row in num_rows:
		
		var max_height = 0
		for idx_col in num_cols:
			var gu = mx_gus[idx_row][idx_col]
			if gu == null:
				continue
			if gu.bounds.size.y > max_height:
				max_height = gu.bounds.size.y
		
		for idx_col in num_cols:
			if mx_dim[idx_row][idx_col] == null:
				continue
			mx_dim[idx_row][idx_col].y = max_height
			
static func calc_widths_by_col(mx_gus, mx_dim, num_rows, num_cols):
	for idx_col in num_cols:
		
		var max_width = 0
		for idx_row in num_rows:
			var gu = mx_gus[idx_row][idx_col]
			if gu == null:
				continue
			if gu.bounds.size.x > max_width:
				max_width = gu.bounds.size.x
				
		for idx_row in num_rows:
			if mx_dim[idx_row][idx_col] == null:
				continue
			mx_dim[idx_row][idx_col].x = max_width
			
static func calc_widths_by_row(mx_gus, mx_dim, num_rows, num_cols):
	for idx_row in num_rows:
		
		var max_width = 0
		for idx_col in num_cols:
			var gu = mx_gus[idx_row][idx_col]
			if gu == null:
				continue
			if gu.bounds.size.x > max_width:
				max_width = gu.bounds.size.x
		
		for idx_col in num_cols:
			if mx_dim[idx_row][idx_col] == null:
				continue
			mx_dim[idx_row][idx_col].x = max_width
			
static func calc_heights_by_col(mx_gus, mx_dim, num_rows, num_cols):
	for idx_col in num_cols:
		
		var max_height = 0
		for idx_row in num_rows:
			var gu = mx_gus[idx_row][idx_col]
			if gu == null:
				continue
			if gu.bounds.size.y > max_height:
				max_height = gu.bounds.size.y
				
		for idx_row in num_rows:
			if mx_dim[idx_row][idx_col] == null:
				continue
			mx_dim[idx_row][idx_col].y = max_height
			
func generate_arr_rq_cells(mx_gus, mx_dim, num_rows, num_cols):
	var arr_rq_cells = []
	for idx_row in num_rows:
		for idx_col in num_cols:
			var gu = mx_gus[idx_row][idx_col]
			if gu == null:
				continue
				
			var rq_gu = gu.to_rq()
			gu.queue_free()
			
			var rq_gu_cell = embedded(
				Color(0,0,0,0), mx_dim[idx_row][idx_col], pos, dir, Vector2(), rq_gu
			)
			
			#arr_rq_cells.append(bordered(Color.RED, 1, rq_gu_cell))
			arr_rq_cells.append(rq_gu_cell)

	return arr_rq_cells

func create_rq_grid(arr_rq_cells):
	var rq_chain = FnGuChain2d.new()
	rq_chain.arr_rq_gu = arr_rq_cells
	rq_chain.breadth_1d = breadth_1d
	rq_chain.pos_1d_next_rel = (dir_1d + Vector2(1,1)) * 0.5
	rq_chain.dir_1d_next = dir_1d
	rq_chain.pos_2d_next_rel = calc_pos_2d()
	rq_chain.dir_2d_next = calc_dir_2d()
	
	return rq_chain

func calc_dir_2d():	
	match (dir_2d):
		Vector2.LEFT, Vector2.RIGHT: return Vector2(dir_2d.x, dir_1d.y)
		Vector2.UP, Vector2.DOWN: return Vector2(dir_1d.x, dir_2d.y)
		
func calc_pos_2d():
	match (dir_2d):
		Vector2.LEFT, Vector2.RIGHT: 
			return (Vector2(dir_2d.x, -dir_1d.y) + Vector2(1,1)) * 0.5
		Vector2.UP, Vector2.DOWN:
			return (Vector2(-dir_1d.x, dir_2d.y) + Vector2(1,1)) * 0.5
