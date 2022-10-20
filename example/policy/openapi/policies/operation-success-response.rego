package openapi.policies["operation-success-response"]

import data.openapi.lib

# METADATA
# title: operation-success-response
# description: Operation must have at least one "2xx" or "3xx" response.
# custom:
#   message: Operation must define at least a single 2xx or 3xx response.
results[lib.format(rego.metadata.rule(), path)] {
	some p, m
	op := input.paths[p][m]
	lib.is_method_valid(m)
	path := ["paths", p, m, "responses"]
	not lib.op_has_success_code(op.responses)
}
