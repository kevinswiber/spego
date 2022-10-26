package openapi.policies["info-description"]

import data.openapi.lib

# METADATA
# title: info-description
# description: Info "description" must be present and non-empty string.
# custom:
#   message: Info "description" must be present and non-empty string.
results[lib.format(rego.metadata.rule(), path)] {
	path := ["info", "description"]
	description := object.get(input, path, true)

	is_not_str := is_string(description) == false
	is_empty := description == ""

	checks := {is_not_str, is_empty}
	checks[true]
}
