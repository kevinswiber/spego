package openapi.policies["duplicated-entry-in-enum"]

test_duplicate_entry_in_enum_fails {
	result1 := {
		"code": "duplicated-entry-in-enum",
		"path": ["components", "schemas", "a", "properties", "b", "items", "enum", "0"],
		"message": "Enum has duplicate value, \"ALPHA\".",
	}

	result2 := {
		"code": "duplicated-entry-in-enum",
		"path": ["components", "schemas", "a", "properties", "b", "items", "enum", "2"],
		"message": "Enum has duplicate value, \"ALPHA\".",
	}

	res := results with input as {"components": {"schemas": {"a": {
		"type": "object",
		"properties": {"b": {
			"type": "array",
			"items": {
				"type": "string",
				"enum": ["ALPHA", "BETA", "ALPHA"],
			},
		}},
	}}}}

	res[result1]
	res[result2]
}
