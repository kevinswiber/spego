package openapi.policies["path-params"]

test_duplicate_path_patterns_fails {
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
