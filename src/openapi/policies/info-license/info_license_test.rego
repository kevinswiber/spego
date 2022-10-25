package openapi.policies["info-license"]

test_license_missing_fails {
	result := {
		"code": "info-license",
		"path": ["info", "license"],
		"message": "Info object must have \"license\" object.",
	}

	results[result] with input as {"info": {}}
}

test_license_non_object_fails {
	result := {
		"code": "info-license",
		"path": ["info", "license"],
		"message": "Info object must have \"license\" object.",
	}

	results[result] with input as {"info": {"license": true}}
}

test_license_exists_succeeds {
	a := results with input as {"info": {"license": {}}}
	count(a) == 0
}
