package openapi.policies["path-params"]

import data.openapi.main.lib

path_regex := "(\\{;?\\??[a-zA-Z0-9_-]+\\*?\\})"

# METADATA
# title: path-params
# description: Path parameters must be defined and valid.
# custom:
#   severity: error
results[lib.format_msg(rego.metadata.rule(), path, message)] {
	normalized_paths := [normalized |
		input.paths[p]
		normalized := regex.replace(p, path_regex, "%")
	]
	paths := [p |
		input.paths[p]
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

	message = sprintf("Paths \"%s\" and \"%s\" must not be equivalent.", [paths[i1], paths[i2]])
	path = ["paths", paths[i2]]
}

# METADATA
# title: path-params
# description: Path parameters must be defined and valid.
# custom:
#   severity: error
results[lib.format_msg(rego.metadata.rule(), path, message)] {
	input.paths[p]
	path := ["paths", p]

	matches := [match |
		all_matches := regex.find_n(path_regex, p, -1)
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

	message = sprintf("Path \"%s\" must not use parameter \"{%s}\" multiple times.", [p, dupe])
}

# METADATA
# title: path-params
# description: Path parameters must be defined and valid.
# custom:
#   severity: error
results[lib.format_msg(rego.metadata.rule(), path, message)] {
	op := input.paths[p]
	param := op.parameters[i]

	param.name
	param.in == "path"

	not param.required == true

	path := ["paths", p, "parameters", sprintf("%d", [i])]
	message := sprintf("Path parameter \"%s\" must have \"required\" property that is set to \"true\".", [param.name])
}

# METADATA
# title: path-params
# description: Path parameters must be defined and valid.
# custom:
#   severity: error
results[lib.format_msg(rego.metadata.rule(), path, message)] {
	op := input.paths[p]
	path_params := [[param.name, i] |
		param := op.parameters[i]

		param.name
		param.in == "path"
	]

	names := [name |
		[name, _] := path_params[_]
	]

	indexes := [index |
		[_, index] := path_params[_]
	]

	names[i1] == names[i2]
	not i1 == i2

	path := ["paths", p, "parameters", sprintf("%d", [indexes[i2]])]
	message := sprintf("Path parameter \"%s\" must not be defined multiple times.", [names[i1]])
}
