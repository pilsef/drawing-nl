class_name TextUtil

static func break_into_lines(s:String, line_len_max) -> Array :
	
	var result = []
	var idx_word_start = 0;
	var idx_line_start = 0;
		
	for idx_char in s.length():
		
		if is_start_of_word(s, idx_char) : # check if we're starting a new word
			idx_word_start = idx_char; # if so, update idx_word_start
		
		 # check if we've completed a line
		if line_should_break(s, idx_line_start, idx_char, line_len_max) :
			
			var line :String
			
			# runoff space or line break
			if (s[idx_char] in [' ', '\n']) :
				line = s.substr(idx_line_start, idx_char)
				idx_line_start = idx_char + 1 # skip one
			# first word on line runs off (biglongwordthatexceedsoneline)
			elif idx_word_start <= idx_line_start :
				line = s.substr(idx_line_start, idx_line_start + line_len_max)
				idx_line_start = idx_line_start + line_len_max # update idx_line_start
			else : # subsequent word on line runs off
				line = s.substr(idx_line_start, idx_word_start)
				idx_line_start = idx_word_start # update idx_line_start
		
			result.append(line)
	
	var line_last = s.substr(idx_line_start, s.length())
	result.append(line_last); # build & add last line
	
	return result;

static func is_start_of_word(s:String, idx_char) -> bool:
	if idx_char == 0 :
		return true;

	var prev = s[idx_char - 1];
	var curr = s[idx_char];
	return (curr == ' ') || (prev == ' ') || (curr == '\n') || (prev == '\n');

# if we run into linebreak or overflow
static func line_should_break(s, idx_line_start, idx_char, line_len_max) :
	return s[idx_char] == '\n' || (idx_char - idx_line_start) >= line_len_max
