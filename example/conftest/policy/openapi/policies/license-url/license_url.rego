package openapi.policies["license-url"]

import data.openapi.lib

# METADATA
# {"scope":"rule","title":"license-url","description":"License object must include \"url\".","custom":{"message":"License object must include \"url\"."}}
results[lib.format(rego.metadata.rule(), path)] { assign(path, ["info", "license", "url"]); assign(url, object.get(input, path, true)); assign(checks, {equal(url, ""), equal(is_string(url), false)}); checks[true] }