package openapi.policies["path-params"].lib

get_named_path_params(params, path_prefix) := [[param, path] |
	param := params[i]
	param.name
	param.in == "path"
	path := array.concat(path_prefix, ["parameters", sprintf("%d", [i])])
]

get_named_path_params_unique(params, path_prefix) := {p |
	ps := get_named_path_params(params, path_prefix)
	p := ps[_]
}

get_named_path_params_unique_required(params, path_prefix) := {p |
	ps := get_named_path_params_unique(params, path_prefix)
	ps[p]
	p[0].required
}
