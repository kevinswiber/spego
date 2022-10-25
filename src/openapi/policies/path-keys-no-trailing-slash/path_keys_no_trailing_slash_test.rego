package openapi.policies["path-keys-no-trailing-slash"]

result := {
	"code": "path-keys-no-trailing-slash",
	"path": ["paths", "/users/"],
	"message": "Path must not end with slash.",
}

test_path_ending_in_slash_fails {
	results[result] with input as {"paths": {"/users/": {}}}
}

test_path_not_ending_in_slash_succeeds {
	count(results) == 0 with input as {"paths": {"/users": {}}}
}
