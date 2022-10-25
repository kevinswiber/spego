package openapi.policies["openapi-tags-uniqueness"]

test_tags_must_be_unique {
	result1 := {
		"code": "openapi-tags-uniqueness",
		"path": ["tags", "0"],
		"message": "\"tags\" object contains duplicate tag name \"A\".",
	}

	result2 := {
		"code": "openapi-tags-uniqueness",
		"path": ["tags", "2"],
		"message": "\"tags\" object contains duplicate tag name \"A\".",
	}

	res := results with input as {"tags": [{"name": "A"}, {"name": "B"}, {"name": "A"}]}

	res[result1]
	res[result2]
}
