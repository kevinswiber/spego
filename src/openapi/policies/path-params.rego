package openapi.policies["path-params"]

import data.openapi.main.lib

# METADATA
# title: path-params
# description: Path parameters must be defined and valid.
# custom:
#   severity: error
results[lib.format_msg(rego.metadata.rule(), path, message)] {
	op := input.paths[p][m]
	lib.is_method_valid(m)
	path_parent := ["paths", p, m, "parameters"]
	path := []
	message := ""
}
