package openapi.policies["operation-success-response"]

test_no_success_response_code_fails {
	mock_input := {"paths": {"/users": {"get": {"responses": {"400": {}}}}}}

	result := {
		"code": "operation-success-response",
		"path": ["paths", "/users", "get", "responses"],
		"message": "Operation must define at least a single 2xx or 3xx response.",
	}
	results[result] with input as mock_input
}

test_success_response_code_succeeds {
	mock_input := {"paths": {"/users": {"get": {"responses": {"200": {}}}}}}

	a := results with input as mock_input

	count(a) == 0
}
