package openapi.policies["tag-description"]

result := {"code": "tag-description", "message": "Tag object must have \"description\".", "path": ["tags", "0"]} { true }
test_missing_tag_description_fails = true { results[result] with input as {"tags": [{"name": "a"}]} }
test_existing_tag_description_succeeds = true { equal(count(results), 0) with input as {"tags": [{"description": "it's an a", "name": "a"}]} }