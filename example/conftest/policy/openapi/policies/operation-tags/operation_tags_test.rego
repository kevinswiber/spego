package openapi.policies["operation-tags"]

result := {"code": "operation-tags", "message": "Operation must have non-empty \"tags\" array.", "path": ["paths", "/example", "get", "tags"]} { true }
test_missing_operation_tags_fails = true { results[result] with input as {"paths": {"/example": {"get": {}}}} }
test_empty_operation_tags_fails = true { results[result] with input as {"paths": {"/example": {"get": {"tags": []}}}} }
test_non_empty_operation_tags_succeeds = true { equal(count(results), 0) with input as {"paths": {"/example": {"get": {"tags": ["a"]}}}} }