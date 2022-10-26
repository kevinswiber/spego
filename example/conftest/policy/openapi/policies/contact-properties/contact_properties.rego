package openapi.policies["contact-properties"]

import data.openapi.lib

# METADATA
# {"scope":"rule","title":"contact-properties","description":"Contact object must have \"name\", \"url\" and \"email\".","custom":{"message":"Contact object must have \"name\", \"url\" and \"email\"."}}
results[lib.format(rego.metadata.rule(), path)] { assign(path, ["info", "contact"]); assign(contact, input.info.contact); assign(required, {"email", "name", "url"}); assign(present, {x | required[x]; contact[x]}); lt(count(present), count(required)) }