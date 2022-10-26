package openapi.policies["no-script-tags-in-markdown"]

import data.openapi.lib
import future.keywords.in

# METADATA
# title: no-script-tags-in-markdown
# description: Markdown descriptions must not have "<script>" tags.
# custom:
#   message: Markdown descriptions must not have "<script>" tags.
results[lib.format(rego.metadata.rule(), path)] {
	valid_props := {"title", "description"}
	titles_and_descriptions := {[md_path, md_val] |
		[current_path, value] := walk(input)

		some key
		valid_props[key]

		md_val := value[key]
		md_path = array.concat(current_path, [key])
	}

	some [path, val] in titles_and_descriptions
	contains(lower(val), "<script")
}
