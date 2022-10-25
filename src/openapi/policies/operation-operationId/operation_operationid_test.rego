package openapi.policies["operation-operationId"]

test_missing_operationid_fails {
	result := {
		"code": "operation-operationId",
		"path": ["paths", "/example", "get", "operationId"],
		"message": "Operation must have \"operationId\".",
	}

	results[result] with input as {"paths": {"/example": {"get": {}}}}
}

test_empty_operationid_fails {
	result := {
		"code": "operation-operationId",
		"path": ["paths", "/example", "get", "operationId"],
		"message": "Operation must have \"operationId\".",
	}

	results[result] with input as {"paths": {"/example": {"get": {"operationId": ""}}}}
}

test_non_empty_operationid_succeeds {
	a := results with input as {"paths": {"/example": {"get": {"operationId": "opId"}}}}
	count(a) == 0
}
