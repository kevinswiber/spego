package openapi.policies["path-not-include-query"]

result := {
	"code": "path-not-include-query",
	"path": ["paths", "/users?hi=there"],
	"message": "Path must not include query string.",
}

test_query_string_in_path_fails {
	results[result] with input as {"paths": {"/users?hi=there": {}}}
}

test_query_string_missing_in_path_succeeds {
	count(results) == 0 with input as {"paths": {"/users": {}}}
}
