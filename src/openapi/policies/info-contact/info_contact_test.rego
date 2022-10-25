package openapi.policies["info-contact"]

test_contact_missing_fails {
	result := {
		"code": "info-contact",
		"path": ["info", "contact"],
		"message": "Info object must have \"contact\" object.",
	}

	results[result] with input as {"info": {}}
}

test_contact_non_object_fails {
	result := {
		"code": "info-contact",
		"path": ["info", "contact"],
		"message": "Info object must have \"contact\" object.",
	}

	results[result] with input as {"info": {"contact": true}}
}

test_contact_exists_succeeds {
	a := results with input as {"info": {"contact": {}}}
	count(a) == 0
}
