package openapi.policies["info-description"]

import data.openapi.lib

# METADATA
# title: info-description
# description: Info "description" must be present and non-empty string.
# custom:
#   recommended: true
results[lib.format(rego.metadata.rule(), path)] {
	path := ["info", "description"]
	description := object.get(input, path, true)

	checks := {
		is_string(description) == false,
		description == "",
	}

	checks[true]
}
