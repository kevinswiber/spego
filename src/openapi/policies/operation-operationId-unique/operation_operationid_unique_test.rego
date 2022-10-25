package openapi.policies["operation-operationId-unique"]

test_duplicate_operationid_fails {
	key := {
		"code": "operation-operationId-unique",
		"path": ["paths", "/users", "get", "operationId"],
		"message": "operationId must be unique",
		"severity": "error",
	}
	results[key] with input as {
		"tags": [],
		"paths": {"/users": {
			"get": {"operationId": "getUsers"},
			"post": {"operationId": "getUsers"},
		}},
	}
}

test_unique_operationid_succeeds {
	a := results with input as {
		"tags": [],
		"paths": {"/users": {
			"get": {"operationId": "getUsers"},
			"post": {"operationId": "postUsers"},
		}},
	}

	count(a) == 0
}
