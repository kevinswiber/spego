package openapi.policies["path-params"].lib

get_duplicate_path_param_definition_results(parameters, path_prefix) := {[path, message] |
	path_params := get_named_path_params(parameters, path_prefix)

	dupes := {name: val |
		[param, _] := path_params[_]
		name = param.name

		val := {index |
			[param, index] = path_params[_]
			name == param.name
		}
		count(val) > 1
	}

	dupes[n] = dupe_indexes
	dupe_indexes[path]

	message := sprintf("Path parameter \"%s\" must not be defined multiple times.", [n])
}
