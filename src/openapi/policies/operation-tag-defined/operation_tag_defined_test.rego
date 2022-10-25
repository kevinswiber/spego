package openapi.policies["operation-tag-defined"]

test_missing_global_tag_fails {
	key := {
		"code": "operation-tag-defined",
		"path": ["paths", "/users", "get", "tags", "0"],
		"message": "Operation tags must be defined in global tags.",
	}
	results[key] with input as {
		"tags": [],
		"paths": {"/users": {"get": {"tags": ["user"]}}},
	}
}

test_present_global_tag_succeeds {
	a := results with input as {
		"tags": [{"name": "user"}],
		"paths": {"/users": {"get": {"tags": ["user"]}}},
	}

	count(a) == 0
}
