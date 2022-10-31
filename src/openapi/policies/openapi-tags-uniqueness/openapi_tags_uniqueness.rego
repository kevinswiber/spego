package openapi.policies["openapi-tags-uniqueness"]

import data.openapi.lib
import future.keywords.in

# METADATA
# title: openapi-tags-uniqueness
# description: Each tag must have a unique name.
# custom:
#   recommended: true
results[lib.format_msg(rego.metadata.rule(), path, message)] {
	tags := input.tags
	dupes := {tagName: indexes |
		some tag in tags
		tagName := tag.name
		indexes := {index |
			some index, inner_tag in tags
			inner_tag.name == tagName
		}
		count(indexes) > 1
	}

	some name, index
	indexes := dupes[name]
	indexes[index]

	path := ["tags", sprintf("%d", [index])]
	message := sprintf("\"tags\" object contains duplicate tag name \"%s\".", [name])
}
