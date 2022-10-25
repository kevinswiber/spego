package openapi.policies["operation-tags"]

result := {
	"code": "operation-tags",
	"path": ["paths", "/example", "get", "tags"],
	"message": "Operation must have non-empty \"tags\" array.",
}

test_missing_operation_tags_fails {
	results[result] with input as {"paths": {"/example": {"get": {}}}}
}

test_empty_operation_tags_fails {
	results[result] with input as {"paths": {"/example": {"get": {"tags": []}}}}
}

test_non_empty_operation_tags_succeeds {
	count(results) == 0 with input as {"paths": {"/example": {"get": {"tags": ["a"]}}}}
}
