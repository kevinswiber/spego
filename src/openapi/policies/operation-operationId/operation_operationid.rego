package openapi.policies["operation-operationId"]

import data.openapi.lib

# METADATA
# title: operation-operationId
# description: Operation must have "operationId".
# custom:
#   message: Operation must have "operationId".
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
