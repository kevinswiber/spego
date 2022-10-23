package openapi.policies["path-params"]

get_duplicate_path_param_definition_results(parameters, path_key) := {[path, message] |
	path_params := get_named_path_params(parameters)

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
	dupe_indexes[i]

	path := ["paths", path_key, "parameters", sprintf("%d", [i])]
	message := sprintf("Path parameter \"%s\" must not be defined multiple times.", [n])
}
