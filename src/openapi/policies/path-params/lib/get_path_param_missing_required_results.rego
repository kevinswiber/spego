package openapi.policies["path-params"].lib

get_path_param_missing_required_results(parameters, path_prefix) := {[path, message] |
	path_params := get_named_path_params_unique(parameters, path_prefix)

	path_params[[param, path]]

	not param.required == true

	message := sprintf("Path parameter \"%s\" must have \"required\" property that is set to \"true\".", [param.name])
}
