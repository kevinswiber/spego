package openapi.policies["path-params"]

get_duplicate_var_name_in_path_results(path_key) := {[path, message] |
	path = ["paths", path_key]

	matches := [match |
		all_matches := regex.find_n(path_regex, path_key, -1)
		m := all_matches[_]
		match := regex.replace(m, "[{}?*;]", "")
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
