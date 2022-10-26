package openapi.policies["path-not-include-query"]

result := {"code": "path-not-include-query", "message": "Path must not include query string.", "path": ["paths", "/users?hi=there"]} { true }
test_query_string_in_path_fails = true { results[result] with input as {"paths": {"/users?hi=there": {}}} }
test_query_string_missing_in_path_succeeds = true { equal(count(results), 0) with input as {"paths": {"/users": {}}} }