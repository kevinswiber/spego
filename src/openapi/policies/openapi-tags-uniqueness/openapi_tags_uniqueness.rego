package openapi.policies["openapi-tags-uniqueness"]

import data.openapi.lib

# METADATA
# title: openapi-tags-uniqueness
# description: Each tag must have a unique name.
results[lib.format_msg(rego.metadata.rule(), path, message)] {
	tags := input.tags
	dupes := {tagName: indexes |
		tagName = tags[_].name
		indexes := {i | tags[i].name == tagName}
		count(indexes) > 1
	}
	indexes := dupes[name]
	indexes[i1]

	path := ["tags", sprintf("%d", [i1])]
	message := sprintf("\"tags\" object contains duplicate tag name \"%s\".", [name])
}
