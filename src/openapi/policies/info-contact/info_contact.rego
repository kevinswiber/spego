package openapi.policies["info-contact"]

import data.openapi.lib

# METADATA
# title: info-contact
# description: Info object must have "contact" object.
# custom:
#   message: Info object must have "contact" object.
results[lib.format(rego.metadata.rule(), path)] {
	path := ["info", "contact"]
	contact := object.get(input, path, true)
	not is_object(contact)
}
