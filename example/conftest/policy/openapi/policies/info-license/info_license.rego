package openapi.policies["info-license"]

import data.openapi.lib

# METADATA
# {"scope":"rule","title":"info-license","description":"Info object must have \"license\" object.","custom":{"message":"Info object must have \"license\" object."}}
results[lib.format(rego.metadata.rule(), path)] { assign(path, ["info", "license"]); assign(license, object.get(input, path, true)); not is_object(license) }