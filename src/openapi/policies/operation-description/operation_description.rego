package openapi.policies["operation-description"]

import data.openapi.lib

# METADATA
# title: operation-description
# description: Operation "description" must be present and non-empty string.
results[lib.format(rego.metadata.rule(), path)] {
	op := input.paths[p][m]
	lib.is_method_valid(m)

	description := object.get(op, "description", true)

	checks := {
		is_string(description) == false,
		description == "",
	}

	checks[true]

	path := ["paths", p, m, "description"]
}
