package openapi.policies["path-params"]

get_named_path_params_unique(params) := {p | p = get_named_path_params(params)[_]}
