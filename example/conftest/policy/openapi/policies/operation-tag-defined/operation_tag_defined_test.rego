package openapi.policies["operation-tag-defined"]

test_missing_global_tag_fails = true { assign(result, {"code": "operation-tag-defined", "message": "Operation tags must be defined in global tags.", "path": ["paths", "/users", "get", "tags", "0"]}); results[result] with input as {"paths": {"/users": {"get": {"tags": ["user"]}}}, "tags": []} }
test_present_global_tag_succeeds = true { assign(a, results) with input as {"paths": {"/users": {"get": {"tags": ["user"]}}}, "tags": [{"name": "user"}]}; equal(count(a), 0) }