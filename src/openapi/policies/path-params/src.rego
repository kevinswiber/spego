package openapi.policies["path-params"]

import data.openapi.main.lib
import future.keywords.in

path_regex := "(\\{;?\\??[a-zA-Z0-9_-]+\\*?\\})"

# METADATA
# title: path-params
# description: Path parameters must be defined and valid.
# custom:
#   severity: error
results[lib.format_msg(rego.metadata.rule(), path, message)] {
	normalized_paths := [normalized |
		input.paths[p]
		normalized := regex.replace(p, path_regex, "%")
	]
	paths := [p |
		input.paths[p]
	]

	dupes := {pair | some i1, i2; normalized_paths[i1] == normalized_paths[i2]; pair := {i1, i2}; count(pair) > 1}
	dupes[pair]

	i1 := pair[0]
	i2 := pair[1]

	message = sprintf("Paths \"%s\" and \"%s\" must not be equivalent.", [paths[i1], paths[i2]])
	path = ["paths", paths[i2]]
}
