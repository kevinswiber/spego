package openapi.policies["operation-operationId"]

test_missing_operationid_fails = true { assign(result, {"code": "operation-operationId", "message": "Operation must have \"operationId\".", "path": ["paths", "/example", "get", "operationId"]}); results[result] with input as {"paths": {"/example": {"get": {}}}} }
test_empty_operationid_fails = true { assign(result, {"code": "operation-operationId", "message": "Operation must have \"operationId\".", "path": ["paths", "/example", "get", "operationId"]}); results[result] with input as {"paths": {"/example": {"get": {"operationId": ""}}}} }
test_non_empty_operationid_succeeds = true { assign(a, results) with input as {"paths": {"/example": {"get": {"operationId": "opId"}}}}; equal(count(a), 0) }