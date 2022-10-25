package openapi.policies["operation-operationId-valid-in-url"]

test_missing_operationid_valid_in_url_fails {
	result := {
		"code": "operation-operationId-valid-in-url",
		"path": ["paths", "/example", "get", "operationId"],
		"message": "operationId must not have characters that are invalid when used in URL.",
	}

	results[result] with input as {"paths": {"/example": {"get": {}}}}
}

test_empty_operationid_valid_in_url_fails {
	result := {
		"code": "operation-operationId-valid-in-url",
		"path": ["paths", "/example", "get", "operationId"],
		"message": "operationId must not have characters that are invalid when used in URL.",
	}

	results[result] with input as {"paths": {"/example": {"get": {"operationId": ""}}}}
}

test_operationid_not_valid_in_url_fails {
	result := {
		"code": "operation-operationId-valid-in-url",
		"path": ["paths", "/example", "get", "operationId"],
		"message": "operationId must not have characters that are invalid when used in URL.",
	}

	results[result] with input as {"paths": {"/example": {"get": {"operationId": "op%Id"}}}}
}

test_non_empty_operationid_valid_in_url_succeeds {
	a := results with input as {"paths": {"/example": {"get": {"operationId": "opId"}}}}
	count(a) == 0
}
