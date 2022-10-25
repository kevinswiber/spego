package openapi.policies["info-description"]

test_description_missing_fails {
	result := {
		"code": "info-description",
		"path": ["info", "description"],
		"message": "Info \"description\" must be present and non-empty string.",
	}

	a := results with input as {"info": {}}
	results[result] with input as {"info": {}}
}

test_description_non_string_fails {
	result := {
		"code": "info-description",
		"path": ["info", "description"],
		"message": "Info \"description\" must be present and non-empty string.",
	}

	results[result] with input as {"info": {"description": true}}
}

test_description_empty_fails {
	result := {
		"code": "info-description",
		"path": ["info", "description"],
		"message": "Info \"description\" must be present and non-empty string.",
	}

	results[result] with input as {"info": {"description": ""}}
}

test_description_exists_succeeds {
	a := results with input as {"info": {"description": "hello"}}
	count(a) == 0
}
