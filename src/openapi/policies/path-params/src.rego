package openapi.policies["path-params"]

import data.openapi.main.lib

path_regex := "(\\{;?\\??[a-zA-Z0-9_-]+\\*?\\})"

# METADATA
# title: path-params
# description: Path parameters must be defined and valid.
# custom:
#   severity: error
results[lib.format_msg(rego.metadata.rule(), path, message)] {
	paths := input.paths

	path_collision_results := get_path_collision_results(paths)
	path_obj_results := get_all_path_obj_results(paths)

	all_results := path_collision_results | path_obj_results
	all_results[[path, message]]
}

get_path_collision_results(paths_obj) = {[p, m] |
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

	m = sprintf("Paths \"%s\" and \"%s\" must not be equivalent.", [paths[i1], paths[i2]])
	p = ["paths", paths[i2]]
}

get_all_path_obj_results(paths) = path_obj_results {
	path_obj := paths[path_key]

	duplicate_var_name_in_path_results := get_duplicate_var_name_in_path_results(path_key)
	path_param_results = get_all_path_parameter_results(path_obj, path_key)

	path_obj_results := duplicate_var_name_in_path_results | path_param_results
}

get_duplicate_var_name_in_path_results(path_key) = {[path, message] |
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

	message = sprintf("Path \"%s\" must not use parameter \"{%s}\" multiple times.", [path_key, dupe])
}

get_all_path_parameter_results(path_obj, path_key) = path_parameter_results {
	not path_obj.parameters
	path_parameter_results = set()
}

get_all_path_parameter_results(path_obj, path_key) = path_parameter_results {
	not is_array(path_obj.parameters)
	path_parameter_results = set()
}

get_all_path_parameter_results(path_obj, path_key) = path_parameter_results {
	parameters := path_obj.parameters
	path_param_missing_requires_results := get_path_param_missing_required_results(parameters, path_key)
	duplicate_path_param_definition_results := get_duplicate_path_param_definition_results(parameters, path_key)

	path_parameter_results = path_param_missing_requires_results | duplicate_path_param_definition_results
}

get_path_param_missing_required_results(parameters, path_key) := {[path, message] |
	path_params := get_unique_named_path_params(parameters)

	path_params[[param, i]]

	param.name
	param.in == "path"

	not param.required == true

	path = ["paths", path_key, "parameters", sprintf("%d", [i])]
	message = sprintf("Path parameter \"%s\" must have \"required\" property that is set to \"true\".", [param.name])
}

add_to_arr(obj, name, value) = a {
	not obj[name]
	a = [value]
}

add_to_arr(obj, name, value) = a {
	val := obj[name]
	a = array.concat(val, [value])
}

get_duplicate_path_param_definition_results(parameters, path_key) := {[path, message] |
	path_params := get_named_path_params(parameters)

	names := [name |
		[param, _] := path_params[_]
		name = param.name
	]

	indexes := [index |
		[_, index] := path_params[_]
	]

	names[i1] == names[i2]
	not i1 == i2

	path = ["paths", path_key, "parameters", sprintf("%d", [indexes[i2]])]
	message = sprintf("Path parameter \"%s\" must not be defined multiple times.", [names[i1]])
}

get_named_path_params(params) := [[param, i] |
	param = params[i]
	param.name
	param.in == "path"
]

get_unique_named_path_params(params) := {p | p = get_named_path_params(params)[_]}
