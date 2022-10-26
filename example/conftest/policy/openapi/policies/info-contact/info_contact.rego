package openapi.policies["info-contact"]

import data.openapi.lib

# METADATA
# {"scope":"rule","title":"info-contact","description":"Info object must have \"contact\" object.","custom":{"message":"Info object must have \"contact\" object."}}
results[lib.format(rego.metadata.rule(), path)] { assign(path, ["info", "contact"]); assign(contact, object.get(input, path, true)); not is_object(contact) }