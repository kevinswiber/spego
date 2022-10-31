package openapi.policies["path-params"]

import data.openapi.lib
import data.openapi.policies["path-params"].lib as policy_lib

# METADATA
# title: path-params
# description: Path parameters must be defined and valid.
# custom:
#   severity: error
#   recommended: true
results[lib.format_msg(rego.metadata.rule(), path, message)] {
	paths := input.paths

	r1 := policy_lib.path_collision_results(paths)
	r2 := all_path_obj_results(paths)

	all_results := r1 | r2
	all_results[[path, message]]
}

all_path_obj_results(paths) := path_obj_results {
	p_results := {p_result |
		path_obj := paths[path_key]

		r1 := policy_lib.duplicate_var_name_in_path_results(path_key)
		r2 = all_path_parameter_results(path_obj, path_key)

		p_result := r1 | r2
	}
	path_obj_results := union(p_results)
}

all_path_parameter_results(path_obj, path_key) := path_parameter_results {
	not path_obj.parameters
	top_params := set()
	path_parameter_results := all_operation_results(path_obj, path_key, top_params)
}

all_path_parameter_results(path_obj, path_key) := path_parameter_results {
	not is_array(path_obj.parameters)
	top_params := set()
	path_parameter_results := all_operation_results(path_obj, path_key, top_params)
}

all_path_parameter_results(path_obj, path_key) := path_parameter_results {
	parameters := path_obj.parameters
	path_prefix = ["paths", path_key]

	r1 := policy_lib.path_param_missing_required_results(parameters, path_prefix)
	r2 := policy_lib.duplicate_path_param_definition_results(parameters, path_prefix)

	top_params := policy_lib.named_path_params_unique_required(parameters, path_prefix)
	r3 := all_operation_results(path_obj, path_key, top_params)

	path_parameter_results := (r1 | r2) | r3
}

all_operation_results(path_obj, path_key, top_params) := op_results {
	all_op_results := {op_result |
		operation := path_obj[method]
		op_result := operation_results(operation, method, path_key, top_params)
	}
	op_results := union(all_op_results)
}

operation_results(operation, method, path_key, top_params) := operation_results {
	not lib.is_method_valid(method)
	operation_results := set()
}

operation_results(operation, method, path_key, top_params) := operation_results {
	lib.is_method_valid(method)
	path := ["paths", path_key, method]

	[r1, inner_params] := all_operation_parameter_results(operation, path)

	defined_params := top_params | inner_params
	r2 := policy_lib.param_asymmetry_results(defined_params, path_key, path)

	operation_results := r1 | r2
}

all_operation_parameter_results(operation, path) := [operation_parameter_results, inner_params] {
	not operation.parameters
	operation_parameter_results := set()
	inner_params := set()
}

all_operation_parameter_results(operation, path) := [operation_parameter_results, inner_params] {
	op_params := operation.parameters
	inner_params := policy_lib.named_path_params_unique_required(op_params, path)

	r1 := policy_lib.path_param_missing_required_results(op_params, path)
	r2 := policy_lib.duplicate_path_param_definition_results(op_params, path)
	operation_parameter_results := r1 | r2
}
