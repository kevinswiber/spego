package openapi.policies["path-params"]

import data.openapi.lib
import data.openapi.policies["path-params"].lib as policy_lib

# METADATA
# title: path-params
# description: Path parameters must be defined and valid.
# custom:
#   severity: error
results[lib.format_msg(rego.metadata.rule(), path, message)] {
	paths := input.paths

	r1 := policy_lib.get_path_collision_results(paths)
	r2 := get_all_path_obj_results(paths)

	all_results := r1 | r2
	all_results[[path, message]]
}

get_all_path_obj_results(paths) := path_obj_results {
	path_obj := paths[path_key]

	r1 := policy_lib.get_duplicate_var_name_in_path_results(path_key)
	r2 = get_all_path_parameter_results(path_obj, path_key)

	path_obj_results := r1 | r2
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

	r1 := policy_lib.get_path_param_missing_required_results(parameters, path_key)
	r2 := policy_lib.get_duplicate_path_param_definition_results(parameters, path_key)

	path_parameter_results := r1 | r2
}
