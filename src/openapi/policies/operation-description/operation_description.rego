package openapi.policies["operation-description"]

import data.openapi.lib

# METADATA
# title: operation-description
# description: Operation "description" must be present and non-empty string.
# custom:
#   message: Operation "description" must be present and non-empty string.
results[lib.format(rego.metadata.rule(), path)] {
	op := input.paths[p][m]
	lib.is_method_valid(m)

	description := object.get(op, "description", true)
	is_not_str := is_string(description) == false
	is_empty := description == ""
	any([is_not_str, is_empty])
	path := ["paths", p, m, "description"]
}
