package openapi.policies["operation-operationId"]

import data.openapi.lib

# METADATA
# {"scope":"rule","title":"operation-operationId","description":"Operation must have \"operationId\".","custom":{"message":"Operation must have \"operationId\"."}}
results[lib.format(rego.metadata.rule(), path)] { assign(op, input.paths[p][m]); lib.is_method_valid(m); is_invalid(op); assign(path, ["paths", p, m, "operationId"]) }
is_invalid(op) = true { not op.operationId }
is_invalid(op) = true { not is_string(op.operationId) }
is_invalid(op) = true { equal(op.operationId, "") }