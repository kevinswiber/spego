package openapi.policies["no-script-tags-in-markdown"]

import data.openapi.lib

# METADATA
# title: no-script-tags-in-markdown
# description: Markdown descriptions must not have "<script>" tags.
# custom:
#   message: Markdown descriptions must not have "<script>" tags.
results[lib.format(rego.metadata.rule(), path)] {
	# TODO: Combine these operations
	titles := {[p1, e] | some p, v, e; [p, v] = walk(input); e = v.title; p1 = array.concat(p, ["title"])}
	descriptions := {[p1, e] | some p, v, e; [p, v] = walk(input); e = v.description; p1 = array.concat(p, ["description"])}

	markdowns := titles | descriptions

	[path, e] = markdowns[_]
	contains(lower(e), "<script")
}
