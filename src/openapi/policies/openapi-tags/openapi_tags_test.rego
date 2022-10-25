package openapi.policies["openapi-tags"]

test_missing_tags_array_fails {
	result := {
		"code": "openapi-tags",
		"path": ["tags"],
		"message": "OpenAPI object must have non-empty \"tags\" array.",
	}

	results[result] with input as {}
}

test_empty_tags_array_fails {
	result := {
		"code": "openapi-tags",
		"path": ["tags"],
		"message": "OpenAPI object must have non-empty \"tags\" array.",
	}

	results[result] with input as {"tags": []}
}

test_non_empty_tags_array_succeeds {
	a := results with input as {"tags": [{"name": "a"}]}
	count(a) == 0
}
