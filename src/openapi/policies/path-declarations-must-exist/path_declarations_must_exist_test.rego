package openapi.policies["path-declarations-must-exist"]

result := {
	"code": "path-declarations-must-exist",
	"path": ["paths", "/given/{}"],
	"message": "Path parameter declarations must not be empty, ex.\"/given/{}\" is invalid.",
}

test_missing_path_declaration_fails {
	results[result] with input as {"paths": {"/given/{}": {}}}
}

test_existing_path_declaration_succeeds {
	count(results) == 0 with input as {"paths": {"/given/{givenId}": {}}}
}
