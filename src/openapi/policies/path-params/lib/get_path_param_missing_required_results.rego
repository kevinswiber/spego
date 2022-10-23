package openapi.policies["path-params"].lib

get_path_param_missing_required_results(parameters, path_key) := {[path, message] |
	path_params := get_named_path_params_unique(parameters)

	path_params[[param, i]]

	param.name
	param.in == "path"

	not param.required == true

	path := ["paths", path_key, "parameters", sprintf("%d", [i])]
	message := sprintf("Path parameter \"%s\" must have \"required\" property that is set to \"true\".", [param.name])
}
