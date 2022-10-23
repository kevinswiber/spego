package openapi.policies["path-params"].lib

get_named_path_params(params) := [[param, i] |
	param = params[i]
	param.name
	param.in == "path"
]
