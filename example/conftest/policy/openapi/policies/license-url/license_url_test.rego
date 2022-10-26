package openapi.policies["license-url"]

test_url_missing_fails = true { assign(result, {"code": "license-url", "message": "License object must include \"url\".", "path": ["info", "license", "url"]}); results[result] with input as {"info": {"license": {}}} }
test_url_non_string_fails = true { assign(result, {"code": "license-url", "message": "License object must include \"url\".", "path": ["info", "license", "url"]}); results[result] with input as {"info": {"license": {"url": true}}} }
test_url_empty_fails = true { assign(result, {"code": "license-url", "message": "License object must include \"url\".", "path": ["info", "license", "url"]}); results[result] with input as {"info": {"license": {"url": ""}}} }
test_url_exists_succeeds = true { assign(a, results) with input as {"info": {"license": {"url": "hello"}}}; equal(count(a), 0) }