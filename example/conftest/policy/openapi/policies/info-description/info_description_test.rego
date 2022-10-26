package openapi.policies["info-description"]

test_description_missing_fails = true { assign(result, {"code": "info-description", "message": "Info \"description\" must be present and non-empty string.", "path": ["info", "description"]}); results[result] with input as {"info": {}} }
test_description_non_string_fails = true { assign(result, {"code": "info-description", "message": "Info \"description\" must be present and non-empty string.", "path": ["info", "description"]}); results[result] with input as {"info": {"description": true}} }
test_description_empty_fails = true { assign(result, {"code": "info-description", "message": "Info \"description\" must be present and non-empty string.", "path": ["info", "description"]}); results[result] with input as {"info": {"description": ""}} }
test_description_exists_succeeds = true { assign(a, results) with input as {"info": {"description": "hello"}}; equal(count(a), 0) }