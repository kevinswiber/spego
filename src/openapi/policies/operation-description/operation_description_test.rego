package openapi.policies["operation-description"]

test_missing_operation_description_fails {
	result := {
		"code": "operation-description",
		"path": ["paths", "/example", "get", "description"],
		"message": "Operation \"description\" must be present and non-empty string.",
	}

	results[result] with input as {"paths": {"/example": {"get": {}}}}
}

test_empty_operation_description_fails {
	result := {
		"code": "operation-description",
		"path": ["paths", "/example", "get", "description"],
		"message": "Operation \"description\" must be present and non-empty string.",
	}

	results[result] with input as {"paths": {"/example": {"get": {"description": ""}}}}
}

test_non_empty_operation_description_succeeds {
	a := results with input as {"paths": {"/example": {"get": {"description": "good one"}}}}
	count(a) == 0
}
