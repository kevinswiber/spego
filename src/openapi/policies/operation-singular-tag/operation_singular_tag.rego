package openapi.policies["operation-singular-tag"]

import data.openapi.lib

# METADATA
# title: operation-singular-tag
# description: Operation must not have more than a singular tag.
# custom:
#   message: Operation must not have more than a singular tag.
results[lib.format(rego.metadata.rule(), path)] {
	op := input.paths[p][m]
	lib.is_method_valid(m)
	count(op.tags) > 1
	path := ["paths", p, m, "tags"]
}
