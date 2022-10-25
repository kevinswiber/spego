package openapi.policies["path-not-include-query"]

import data.openapi.lib

# METADATA
# title: path-not-include-query
# description: Path must not include query string.
# custom:
#   message: Path must not include query string.
results[lib.format(rego.metadata.rule(), path)] {
	input.paths[path_key]
	contains(path_key, "?")
	path := ["paths", path_key]
}
