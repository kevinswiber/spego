package openapi.policies["operation-operationId-unique"]

import data.openapi.lib

operation_ids := [operationId | assign(operationId, input.paths[_][_].operationId)] { true }
# METADATA
# {"scope":"rule","title":"operation-operationId-unique","description":"Every operation must have unique \"operationId\".","custom":{"message":"operationId must be unique","severity":"error"}}
results[lib.format(rego.metadata.rule(), path)] { assign(op, input.paths[p][m]); lib.is_method_valid(m); assign(path, ["paths", p, m, "operationId"]); assign(filtered, [id | equal(operation_ids[id], op.operationId)]); gt(count(filtered), 1) }