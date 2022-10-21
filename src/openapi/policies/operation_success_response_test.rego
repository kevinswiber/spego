package openapi.policies["operation-success-response"]

test_no_success_response_code_fails {
	mock_input := {"paths": {"/users": {"get": {"responses": {"400": {}}}}}}

	key := {
		"code": "operation-success-response",
		"path": ["paths", "/users", "get", "responses"],
		"message": "Operation must define at least a single 2xx or 3xx response.",
	}
	results[key] with input as mock_input
}

test_success_response_code_succeeds {
	mock_input := {"paths": {"/users": {"get": {"responses": {"200": {}}}}}}

	key := {
		"code": "operation-success-response",
		"path": ["paths", "/users", "get", "responses"],
		"message": "Operation must define at least a single 2xx or 3xx response.",
	}
	count(results) == 0 with input as mock_input
}
