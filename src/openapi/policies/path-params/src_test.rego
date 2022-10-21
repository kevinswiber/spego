package openapi.policies["path-params"]

test_duplicate_path_patterns_fails {
	mock_input := {"paths": {"/users/{userId}": {"get": {}}, "/users/{pathId}": {"get": {}}}}

	key := {
		"code": "path-params",
		"path": ["paths", "/users/{userId}"],
		"message": "Paths \"/users/{pathId}\" and \"/users/{userId}\" must not be equivalent.",
	}
	results[key] with input as mock_input
}
