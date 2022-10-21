package openapi.policies["operation-operationId-unique"]

test_duplicate_operationid_fails {
	key := {
		"code": "operation-operationId-unique",
		"path": ["paths", "/users", "get", "operationId"],
		"message": "operationId must be unique",
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
	count(results) == 0 with input as {
		"tags": [],
		"paths": {"/users": {
			"get": {"operationId": "getUsers"},
			"post": {"operationId": "postUsers"},
		}},
	}
}
