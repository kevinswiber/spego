package openapi.policies["info-license"]

test_license_missing_fails = true { assign(result, {"code": "info-license", "message": "Info object must have \"license\" object.", "path": ["info", "license"]}); results[result] with input as {"info": {}} }
test_license_non_object_fails = true { assign(result, {"code": "info-license", "message": "Info object must have \"license\" object.", "path": ["info", "license"]}); results[result] with input as {"info": {"license": true}} }
test_license_exists_succeeds = true { assign(a, results) with input as {"info": {"license": {}}}; equal(count(a), 0) }