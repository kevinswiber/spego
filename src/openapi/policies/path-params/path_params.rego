package openapi.policies["path-params"]

import data.openapi.lib

path_regex := "(\\{;?\\??[a-zA-Z0-9_-]+\\*?\\})"

# METADATA
# title: path-params
# description: Path parameters must be defined and valid.
# custom:
#   severity: error
results[lib.format_msg(rego.metadata.rule(), path, message)] {
	paths := input.paths

	path_collision_results := get_top_level_paths_results(paths)
	path_obj_results := get_all_path_obj_results(paths)

	all_results := path_collision_results | path_obj_results
	all_results[[path, message]]
}

get_top_level_paths_results(paths) := get_path_collision_results(paths)

get_all_path_obj_results(paths) := path_obj_results {
	path_obj := paths[path_key]

	duplicate_var_name_in_path_results := get_duplicate_var_name_in_path_results(path_key)
	path_param_results = get_all_path_parameter_results(path_obj, path_key)

	path_obj_results := duplicate_var_name_in_path_results | path_param_results
}

get_all_path_parameter_results(path_obj, path_key) := path_parameter_results {
	not path_obj.parameters
	path_parameter_results := set()
}

get_all_path_parameter_results(path_obj, path_key) := path_parameter_results {
	not is_array(path_obj.parameters)
	path_parameter_results := set()
}

get_all_path_parameter_results(path_obj, path_key) := path_parameter_results {
	parameters := path_obj.parameters
	path_param_missing_requires_results := get_path_param_missing_required_results(parameters, path_key)
	duplicate_path_param_definition_results := get_duplicate_path_param_definition_results(parameters, path_key)

	path_parameter_results := path_param_missing_requires_results | duplicate_path_param_definition_results
}
