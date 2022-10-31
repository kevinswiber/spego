package openapi.policies["tag-description"]

import data.openapi.lib

# METADATA
# title: tag-description
# description: Tag object must have "description".
# custom:
#   recommended: false
results[lib.format(rego.metadata.rule(), path)] {
	tags := input.tags

	some i
	tags[i]

	not tags[i].description
	path := ["tags", sprintf("%d", [i])]
}
