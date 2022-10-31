package openapi.policies["operation-operationId-valid-in-url"]

import data.openapi.lib

# METADATA
# title: operation-operationId-valid-in-url
# description: operationId must not have characters that are invalid when used in URL.
results[lib.format(rego.metadata.rule(), path)] {
	op := input.paths[p][m]
	lib.is_method_valid(m)
	is_invalid(op)
	path := ["paths", p, m, "operationId"]
}

is_invalid(op) {
	not op.operationId
}

is_invalid(op) {
	not is_string(op.operationId)
}

is_invalid(op) {
	op.operationId == ""
}

is_invalid(op) {
	not regex.match("^[A-Za-z0-9-._~:/?#\\[\\]@!\\$&'()*+,;=]*$", op.operationId)
}
