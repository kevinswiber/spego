package openapi.policies["operation-tags"]

import data.openapi.lib

# METADATA
# title: operation-tags
# description: Operation must have non-empty "tags" array.
# custom:
#   message: Operation must have non-empty "tags" array.
results[lib.format(rego.metadata.rule(), path)] {
	op := input.paths[p][m]
	lib.is_method_valid(m)
	tags := object.get(op, "tags", true)
	is_invalid(tags)
	path := ["paths", p, m, "tags"]
}

is_invalid(tags) {
	not tags
}

is_invalid(tags) {
	not is_array(tags)
}

is_invalid(tag) {
	count(tag) == 0
}
