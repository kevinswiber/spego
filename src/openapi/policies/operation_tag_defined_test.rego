package openapi.policies["operation-tag-defined"]

import data.openapi.main.lib

test_missing_global_tag_denied {
	code := "operation-tag-defined"
	path := ["paths", "/users", "get", "tags", "0"]
	message := "Operation tags must be defined in global tags."
	results[{"code": code, "path": path, "message": message}] with input as {
		"tags": [],
		"paths": {"/users": {"get": {"tags": ["user"]}}},
	}
}

test_present_global_tag_allowed {
	count(results) == 0 with input as {
		"tags": [{"name": "user"}],
		"paths": {"/users": {"get": {"tags": ["user"]}}},
	}
}
