package openapi.policies["path-declarations-must-exist"]

result := {"code": "path-declarations-must-exist", "message": "Path parameter declarations must not be empty, ex.\"/given/{}\" is invalid.", "path": ["paths", "/given/{}"]} { true }
test_missing_path_declaration_fails = true { results[result] with input as {"paths": {"/given/{}": {}}} }
test_existing_path_declaration_succeeds = true { equal(count(results), 0) with input as {"paths": {"/given/{givenId}": {}}} }