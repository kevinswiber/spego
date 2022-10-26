package openapi.policies["info-license"]

import data.openapi.lib

# METADATA
# title: info-license
# description: Info object must have "license" object.
# license: Info object must have "license" object.
# custom:
#   message: Info object must have "license" object.
results[lib.format(rego.metadata.rule(), path)] {
	path := ["info", "license"]
	license := object.get(input, path, true)
	not is_object(license)
}
