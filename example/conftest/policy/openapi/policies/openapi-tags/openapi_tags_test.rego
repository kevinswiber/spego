package openapi.policies["openapi-tags"]

test_missing_tags_array_fails = true { assign(result, {"code": "openapi-tags", "message": "OpenAPI object must have non-empty \"tags\" array.", "path": ["tags"]}); results[result] with input as {} }
test_empty_tags_array_fails = true { assign(result, {"code": "openapi-tags", "message": "OpenAPI object must have non-empty \"tags\" array.", "path": ["tags"]}); results[result] with input as {"tags": []} }
test_non_empty_tags_array_succeeds = true { assign(a, results) with input as {"tags": [{"name": "a"}]}; equal(count(a), 0) }