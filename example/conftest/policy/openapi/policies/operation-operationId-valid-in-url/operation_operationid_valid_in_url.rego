package openapi.policies["operation-operationId-valid-in-url"]

import data.openapi.lib

# METADATA
# {"scope":"rule","title":"operation-operationId-valid-in-url","description":"operationId must not have characters that are invalid when used in URL.","custom":{"message":"operationId must not have characters that are invalid when used in URL."}}
results[lib.format(rego.metadata.rule(), path)] { assign(op, input.paths[p][m]); lib.is_method_valid(m); is_invalid(op); assign(path, ["paths", p, m, "operationId"]) }
is_invalid(op) = true { not op.operationId }
is_invalid(op) = true { not is_string(op.operationId) }
is_invalid(op) = true { equal(op.operationId, "") }
is_invalid(op) = true { not regex.match("^[A-Za-z0-9-._~:/?#\\[\\]@!\\$&'()*+,;=]*$", op.operationId) }