package openapi.policies["operation-success-response"]

import data.openapi.lib

# METADATA
# title: operation-success-response
# description: Operation must have at least one "2xx" or "3xx" response.
# custom:
#   recommended: true
results[lib.format(rego.metadata.rule(), path)] {
	some p, m
	op := input.paths[p][m]
	lib.is_method_valid(m)
	path := ["paths", p, m, "responses"]
	not op_has_success_code(op.responses)
}

op_has_success_code(responses) {
	responses["2xx"]
}

op_has_success_code(responses) {
	responses["3xx"]
}

op_has_success_code(responses) {
	success_codes := [code |
		responses[code]
		k := to_number(code)
		k >= 200
		k < 400
	]
	count(success_codes) > 0
}
