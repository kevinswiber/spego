package openapi.policies["operation-parameters"]

test_duplicate_parameters_fails {
	mock_input := {
		"tags": [],
		"paths": {"/users": {"get": {"parameters": [
			{
				"name": "a",
				"in": "header",
			},
			{
				"name": "a",
				"in": "header",
			},
		]}}},
	}

	result1 := {
		"code": "operation-parameters",
		"path": ["paths", "/users", "get", "parameters", "0"],
		"message": "A parameter in this operation already exposes the same combination of \"name\" and \"in\" values.",
	}

	result2 := {
		"code": "operation-parameters",
		"path": ["paths", "/users", "get", "parameters", "1"],
		"message": "A parameter in this operation already exposes the same combination of \"name\" and \"in\" values.",
	}

	res := results with input as mock_input

	res[result1]
	res[result2]
}

test_both_body_and_formdata_params_fails {
	mock_input := {
		"tags": [],
		"paths": {"/users": {"get": {"parameters": [
			{
				"name": "a",
				"in": "body",
			},
			{
				"name": "b",
				"in": "formData",
			},
		]}}},
	}

	result := {
		"code": "operation-parameters",
		"path": ["paths", "/users", "get", "parameters"],
		"message": "Operation must not have both \"in:body\" and \"in:formData\" parameters.",
	}
	results[result] with input as mock_input
}

test_multiple_body_params_fails {
	mock_input := {
		"tags": [],
		"paths": {"/users": {"get": {"parameters": [
			{
				"name": "a",
				"in": "body",
			},
			{
				"name": "b",
				"in": "body",
			},
		]}}},
	}

	result1 := {
		"code": "operation-parameters",
		"path": ["paths", "/users", "get", "parameters", "0"],
		"message": "Operation must not have more than a single instance of the \"in:body\" parameter.",
	}

	result2 := {
		"code": "operation-parameters",
		"path": ["paths", "/users", "get", "parameters", "1"],
		"message": "Operation must not have more than a single instance of the \"in:body\" parameter.",
	}

	res := results with input as mock_input

	res[result1]
	res[result2]
}

test_unique_parameters_succeeds {
	a := results with input as {
		"tags": [],
		"paths": {"/users": {"get": {"parameters": [
			{
				"name": "a",
				"in": "header",
			},
			{
				"name": "b",
				"in": "header",
			},
		]}}},
	}

	count(a) == 0
}

test_single_body_or_formdata_param_succeeds {
	a := results with input as {
		"tags": [],
		"paths": {"/users": {"get": {"parameters": [
			{
				"name": "a",
				"in": "header",
			},
			{
				"name": "b",
				"in": "body",
			},
		]}}},
	}

	count(a) == 0

	b := results with input as {
		"tags": [],
		"paths": {"/users": {"get": {"parameters": [
			{
				"name": "a",
				"in": "header",
			},
			{
				"name": "b",
				"in": "formData",
			},
		]}}},
	}

	count(b) == 0
}

test_single_body_param_succeeds {
	a := results with input as {
		"tags": [],
		"paths": {"/users": {"get": {"parameters": [
			{
				"name": "a",
				"in": "header",
			},
			{
				"name": "b",
				"in": "body",
			},
		]}}},
	}

	count(a) == 0
}
