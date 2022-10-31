package openapi.policies["operation-operationId-unique"]

import data.openapi.lib

operation_ids := [operationId |
	operationId := input.paths[_][_].operationId
]

# METADATA
# title: operation-operationId-unique
# description: Every operation must have unique "operationId".
# custom:
#   message: operationId must be unique
#   severity: error
results[lib.format(rego.metadata.rule(), path)] {
	op := input.paths[p][m]
	lib.is_method_valid(m)
	path := ["paths", p, m, "operationId"]
	filtered := [id | operation_ids[id] == op.operationId]
	count(filtered) > 1
}
