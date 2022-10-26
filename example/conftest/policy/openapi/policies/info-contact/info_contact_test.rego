package openapi.policies["info-contact"]

test_contact_missing_fails = true { assign(result, {"code": "info-contact", "message": "Info object must have \"contact\" object.", "path": ["info", "contact"]}); results[result] with input as {"info": {}} }
test_contact_non_object_fails = true { assign(result, {"code": "info-contact", "message": "Info object must have \"contact\" object.", "path": ["info", "contact"]}); results[result] with input as {"info": {"contact": true}} }
test_contact_exists_succeeds = true { assign(a, results) with input as {"info": {"contact": {}}}; equal(count(a), 0) }