package openapi.policies["operation-singular-tag"]

test_multiple_tags_on_operation_fails = true { assign(result, {"code": "operation-singular-tag", "message": "Operation must not have more than a singular tag.", "path": ["paths", "/example", "get", "tags"]}); results[result] with input as {"paths": {"/example": {"get": {"tags": ["A", "B"]}}}} }
test_singular_tag_on_operation_succeeds = true { assign(a, results) with input as {"paths": {"/example": {"get": {"tags": ["A"]}}}}; equal(count(a), 0) }