package openapi.policies["path-keys-no-trailing-slash"]

result := {"code": "path-keys-no-trailing-slash", "message": "Path must not end with slash.", "path": ["paths", "/users/"]} { true }
test_path_ending_in_slash_fails = true { results[result] with input as {"paths": {"/users/": {}}} }
test_path_not_ending_in_slash_succeeds = true { equal(count(results), 0) with input as {"paths": {"/users": {}}} }