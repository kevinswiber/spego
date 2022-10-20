package openapi.policies["operation-tag-defined"]

import data.openapi.lib
import future.keywords.in

# METADATA
# title: operation-tag-defined
# description: Operation tags must be defined in global tags.
# custom:
#   message: Operation tags must be defined in global tags.
results[lib.format(rego.metadata.rule(), path)] {
	global_tags := [tag.name |
		tag := input.tags[_]
		is_object(tag)
		is_string(tag.name)
	]

	op := input.paths[p][m]
	lib.is_method_valid(m)
	is_array(op.tags)

	some i, tag in op.tags
	not tag in global_tags
	path := ["paths", p, m, "tags", sprintf("%d", [i])]
}
