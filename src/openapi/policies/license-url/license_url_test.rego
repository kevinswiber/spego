package openapi.policies["license-url"]

test_url_missing_fails {
	result := {
		"code": "license-url",
		"path": ["info", "license", "url"],
		"message": "License object must include \"url\".",
	}

	results[result] with input as {"info": {"license": {}}}
}

test_url_non_string_fails {
	result := {
		"code": "license-url",
		"path": ["info", "license", "url"],
		"message": "License object must include \"url\".",
	}

	results[result] with input as {"info": {"license": {"url": true}}}
}

test_url_empty_fails {
	result := {
		"code": "license-url",
		"path": ["info", "license", "url"],
		"message": "License object must include \"url\".",
	}

	results[result] with input as {"info": {"license": {"url": ""}}}
}

test_url_exists_succeeds {
	a := results with input as {"info": {"license": {"url": "hello"}}}
	count(a) == 0
}
