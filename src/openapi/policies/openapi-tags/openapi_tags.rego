package openapi.policies["openapi-tags"]

import data.openapi.lib

# METADATA
# title: openapi-tags
# description: OpenAPI object must have non-empty "tags" array.
results[lib.format(rego.metadata.rule(), path)] {
	tags := object.get(input, "tags", true)

	is_invalid(tags)
	path := ["tags"]
}

is_invalid(tags) {
	not tags
	true
}

is_invalid(tags) {
	is_tags_array := is_array(tags)
	not is_tags_array
}

is_invalid(tags) {
	count(tags) == 0
}
