package openapi.policies["info-description"]

import data.openapi.lib

# METADATA
# {"scope":"rule","title":"info-description","description":"Info \"description\" must be present and non-empty string.","custom":{"message":"Info \"description\" must be present and non-empty string."}}
results[lib.format(rego.metadata.rule(), path)] { assign(path, ["info", "description"]); assign(description, object.get(input, path, true)); assign(checks, {equal(description, ""), equal(is_string(description), false)}); checks[true] }