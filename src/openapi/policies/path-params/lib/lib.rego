package openapi.policies["path-params"].lib

named_path_params(params, path_prefix) := [[param, path] |
	param := params[i]
	param.name
	param.in == "path"
	path := array.concat(path_prefix, ["parameters", sprintf("%d", [i])])
]

named_path_params_unique(params, path_prefix) := {p |
	ps := named_path_params(params, path_prefix)
	p := ps[_]
}

named_path_params_unique_required(params, path_prefix) := {p |
	ps := named_path_params_unique(params, path_prefix)
	ps[p]
	p[0].required
}

regex_omit(original, pattern) := modified {
	parts := regex.split(pattern, original)
	modified := concat("", parts)
}
