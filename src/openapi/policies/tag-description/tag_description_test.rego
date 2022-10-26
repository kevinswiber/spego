package openapi.policies["tag-description"]

result := {
	"code": "tag-description",
	"path": ["tags", "0"],
	"message": "Tag object must have \"description\".",
}

test_missing_tag_description_fails {
	results[result] with input as {"tags": [{"name": "a"}]}
}

test_existing_tag_description_succeeds {
	count(results) == 0 with input as {"tags": [{"name": "a", "description": "it's an a"}]}
}
