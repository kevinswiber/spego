package openapi.policies["no-eval-in-markdown"]

import data.openapi.lib

# METADATA
# title: no-eval-in-markdown
# description: Markdown descriptions must not have "eval(".
# custom:
#   message: Markdown descriptions must not have "eval(".
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
	contains(lower(e), "eval(")
}
