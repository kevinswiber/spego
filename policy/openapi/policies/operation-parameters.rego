package openapi.policies["operation-parameters"]

import data.openapi.lib
import future.keywords.in

# METADATA
# title: operation-parameters
# description: Operation parameters are unique and non-repeating.
results[lib.format_msg(rego.metadata.rule(), path, message)] {
	op := input.paths[p][m]
	lib.is_method_valid(m)
	path := ["paths", p, m, "parameters"]
	params := op.parameters
	message := ""
	is_array(params)
	count(params) > 1
	some i, param in params
	true
}
