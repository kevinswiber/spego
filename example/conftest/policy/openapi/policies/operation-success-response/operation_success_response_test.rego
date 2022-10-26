package openapi.policies["operation-success-response"]

test_no_success_response_code_fails = true { assign(mock_input, {"paths": {"/users": {"get": {"responses": {"400": {}}}}}}); assign(result, {"code": "operation-success-response", "message": "Operation must define at least a single 2xx or 3xx response.", "path": ["paths", "/users", "get", "responses"]}); results[result] with input as mock_input }
test_success_response_code_succeeds = true { assign(mock_input, {"paths": {"/users": {"get": {"responses": {"200": {}}}}}}); assign(a, results) with input as mock_input; equal(count(a), 0) }