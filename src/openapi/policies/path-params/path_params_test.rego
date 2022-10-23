package openapi.policies["path-params"]

test_duplicate_path_patterns_in_operation_fails {
	mock_input := {"paths": {"/users/{userId}": {"get": {}}, "/users/{pathId}": {"get": {}}}}

	key1 := {
		"code": "path-params",
		"path": ["paths", "/users/{userId}"],
		"message": "Paths \"/users/{pathId}\" and \"/users/{userId}\" must not be equivalent.",
	}
	results[key1] with input as mock_input

	key2 := {
		"code": "path-params",
		"path": ["paths", "/users/{pathId}"],
		"message": "Paths \"/users/{userId}\" and \"/users/{pathId}\" must not be equivalent.",
	}
	results[key2] with input as mock_input
}

test_duplicate_path_vars_in_pattern_fails {
	mock_input := {"paths": {"/users/{userId}/{userId}": {"get": {}}}}

	key := {
		"code": "path-params",
		"path": ["paths", "/users/{userId}/{userId}"],
		"message": "Path \"/users/{userId}/{userId}\" must not use parameter \"{userId}\" multiple times.",
	}
	results[key] with input as mock_input
}

test_path_parameter_is_not_required_fails {
	mock_input := {"paths": {"/users/{userId}": {"parameters": [{
		"name": "userId",
		"in": "path",
	}]}}}

	key := {
		"code": "path-params",
		"path": ["paths", "/users/{userId}", "parameters", "0"],
		"message": "Path parameter \"userId\" must have \"required\" property that is set to \"true\".",
	}
	results[key] with input as mock_input
}

test_path_parameter_duplicate_name_fails {
	mock_input := {"paths": {"/users/{userId}": {"parameters": [
		{
			"name": "userId",
			"in": "path",
			"required": true,
		},
		{
			"name": "userId",
			"in": "path",
			"required": true,
		},
	]}}}

	key1 := {
		"code": "path-params",
		"path": ["paths", "/users/{userId}", "parameters", "1"],
		"message": "Path parameter \"userId\" must not be defined multiple times.",
	}
	results[key1] with input as mock_input

	key2 := {
		"code": "path-params",
		"path": ["paths", "/users/{userId}", "parameters", "0"],
		"message": "Path parameter \"userId\" must not be defined multiple times.",
	}
	results[key2] with input as mock_input
}

test_path_parameter_is_required_succeeds {
	mock_input := {"paths": {"/users/{userId}": {"parameters": [{
		"name": "userId",
		"in": "path",
		"required": true,
	}]}}}

	count(results) == 0 with input as mock_input
}
