package openapi.policies["operation-singular-tag"]

test_multiple_tags_on_operation_fails {
	result := {
		"code": "operation-singular-tag",
		"path": ["paths", "/example", "get", "tags"],
		"message": "Operation must not have more than a singular tag.",
	}

	results[result] with input as {"paths": {"/example": {"get": {"tags": ["A", "B"]}}}}
}

test_singular_tag_on_operation_succeeds {
	a := results with input as {"paths": {"/example": {"get": {"tags": ["A"]}}}}
	count(a) == 0
}
