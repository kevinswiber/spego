package openapi.policies["contact-properties"]

test_contact_missing_name_fails {
	result := {
		"code": "contact-properties",
		"path": ["info", "contact"],
		"message": "Contact object must have \"name\", \"url\" and \"email\".",
	}

	results[result] with input as {"info": {"contact": {
		"url": "https://example.org",
		"email": "web@example.org",
	}}}
}

test_contact_missing_email_fails {
	result := {
		"code": "contact-properties",
		"path": ["info", "contact"],
		"message": "Contact object must have \"name\", \"url\" and \"email\".",
	}

	results[result] with input as {"info": {"contact": {
		"name": "Example",
		"url": "https://example.org",
	}}}
}

test_contact_missing_url_fails {
	result := {
		"code": "contact-properties",
		"path": ["info", "contact"],
		"message": "Contact object must have \"name\", \"url\" and \"email\".",
	}

	results[result] with input as {"info": {"contact": {
		"name": "Example",
		"email": "web@example.org",
	}}}
}

test_contact_with_all_fields_succeeds {
	count(results) == 0 with input as {"info": {"contact": {
		"name": "Example",
		"email": "web@example.org",
		"url": "https://example.com",
	}}}
}
