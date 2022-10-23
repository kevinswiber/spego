package openapi.policies["path-params"].lib

get_named_path_params_unique(params) := {p | p = get_named_path_params(params)[_]}
