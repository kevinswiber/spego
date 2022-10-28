package openapi.policies["license-url"]

import data.openapi.lib

# METADATA
# title: license-url
# description: License object must include "url".
results[lib.format(rego.metadata.rule(), path)] {
	path := ["info", "license", "url"]
	url := object.get(input, path, true)

	checks := {
		is_string(url) == false,
		url == "",
	}

	checks[true]
}
