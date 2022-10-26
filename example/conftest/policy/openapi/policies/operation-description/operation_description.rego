package openapi.policies["operation-description"]

import data.openapi.lib

# METADATA
# {"scope":"rule","title":"operation-description","description":"Operation \"description\" must be present and non-empty string.","custom":{"message":"Operation \"description\" must be present and non-empty string."}}
results[lib.format(rego.metadata.rule(), path)] { assign(op, input.paths[p][m]); lib.is_method_valid(m); assign(description, object.get(op, "description", true)); assign(checks, {equal(description, ""), equal(is_string(description), false)}); checks[true]; assign(path, ["paths", p, m, "description"]) }