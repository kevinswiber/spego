package openapi.policies["contact-properties"]

import data.openapi.lib

# METADATA
# title: contact-properties 
# description: Contact object must have "name", "url" and "email".
# custom:
#   message: Contact object must have "name", "url" and "email".
results[lib.format(rego.metadata.rule(), path)] {
	path := ["info", "contact"]
	contact := input.info.contact

	required := {"name", "email", "url"}
	present := {x | required[x]; contact[x]}

	count(present) < count(required)
}
