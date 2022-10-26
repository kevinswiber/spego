package openapi.policies["path-params"].lib

import future.keywords.in

path_collision_results(paths_obj) := {[p, m] |
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

	some [i1, i2] in dupes

	m := sprintf("Paths \"%s\" and \"%s\" must not be equivalent.", [paths[i1], paths[i2]])
	p := ["paths", paths[i2]]
}
