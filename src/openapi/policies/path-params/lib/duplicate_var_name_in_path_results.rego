package openapi.policies["path-params"].lib

import future.keywords.in

duplicate_var_name_in_path_results(path_key) := {[path, message] |
	path := ["paths", path_key]

	matches := [match |
		# regex.find_n is SDK-dependent and not working in Wasm.
		# all_matches := regex.find_n(path_regex, path_key, -1)
		all_matches := regex.find_all_string_submatch_n(path_regex, path_key, -1)
		some m in all_matches

		# regex.replace is SDK-dependent and not working in Wasm.
		# match := regex.replace(m, "[{}?*;]", "")
		match := regex_omit(m[0], "[{}?*;]")
	]

	dupes := {match |
		some i1, i2
		matches[i1] == matches[i2]
		not i1 == i2
		match = matches[i1]
	}

	dupes[dupe]

	message := sprintf("Path \"%s\" must not use parameter \"{%s}\" multiple times.", [path_key, dupe])
}
