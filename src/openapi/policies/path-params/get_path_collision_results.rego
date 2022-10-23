package openapi.policies["path-params"]

get_path_collision_results(paths_obj) := {[p, m] |
	normalized_paths := [normalized |
		paths_obj[path]
		normalized := regex.replace(path, path_regex, "%")
	]
	paths := [path |
		paths_obj[path]
	]

	dupes := [pair |
		some i1, i2
		normalized_paths[i1] == normalized_paths[i2]
		not i1 == i2
		pair := [i1, i2]
	]

	pair := dupes[_]

	i1 := pair[0]
	i2 := pair[1]

	m := sprintf("Paths \"%s\" and \"%s\" must not be equivalent.", [paths[i1], paths[i2]])
	p := ["paths", paths[i2]]
}
