package openapi.policies["path-params"].lib

path_param_missing_required_results(parameters, path_prefix) := {[path, message] | assign(path_params, named_path_params_unique(parameters, path_prefix)); path_params[[param, path]]; not equal(param.required, true); assign(message, sprintf("Path parameter \"%s\" must have \"required\" property that is set to \"true\".", [param.name]))} { true }