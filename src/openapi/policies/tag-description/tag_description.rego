package openapi.policies["tag-description"]

import data.openapi.lib

# METADATA
# title: tag-description
# description: Tag object must have "description".
# custom:
#   message: Tag object must have "description".
results[lib.format(rego.metadata.rule(), path)] {
	tags := input.tags
	tags[i]
	not tags.description
	path := ["tags", sprintf("%d", [i])]
}
