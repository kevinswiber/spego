package openapi.policies["no-script-tags-in-markdown"]

import data.openapi.lib

# METADATA
# title: no-script-tags-in-markdown
# description: Markdown descriptions must not have "<script>" tags.
# custom:
#   message: Markdown descriptions must not have "<script>" tags.
results[lib.format(rego.metadata.rule(), path)] {
	valid_props := {"title", "description"}
	titles_and_descriptions := {[md_path, md_val] |
		some key
		[p, v] := walk(input)
		valid_props[key]
		md_val := v[key]
		md_path = array.concat(p, [key])
	}

	[path, e] = titles_and_descriptions[_]
	contains(lower(e), "<script")
}
