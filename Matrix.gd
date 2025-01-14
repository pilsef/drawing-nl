extends Resource

class_name Matrix

static func create(num_rows, num_cols):
	var mx = []
	
	for idx_row in num_rows:
		mx.append([])
		for idx_col in num_cols:
			mx[idx_row].append(null)
	
	return mx
