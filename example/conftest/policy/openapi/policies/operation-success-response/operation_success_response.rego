package openapi.policies["operation-success-response"]

import data.openapi.lib

# METADATA
# {"scope":"rule","title":"operation-success-response","description":"Operation must have at least one \"2xx\" or \"3xx\" response.","custom":{"message":"Operation must define at least a single 2xx or 3xx response."}}
results[lib.format(rego.metadata.rule(), path)] { some p, m; assign(op, input.paths[p][m]); lib.is_method_valid(m); assign(path, ["paths", p, m, "responses"]); not op_has_success_code(op.responses) }
op_has_success_code(responses) = true { responses["2xx"] }
op_has_success_code(responses) = true { responses["3xx"] }
op_has_success_code(responses) = true { assign(success_codes, [code | responses[code]; assign(k, to_number(code)); gte(k, 200); lt(k, 400)]); gt(count(success_codes), 0) }