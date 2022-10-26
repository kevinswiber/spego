package openapi.main

import future.keywords.in

# METADATA
# {"scope":"rule","title":"problems","description":"Returns all non-successful rule validation results."}
problems[msg] { policy_refs[policy_ref]; data.openapi.policies[policy_ref].results[result]; equal(result.code, policy_ref); assign(severity_default, resolve_result_severity(result, "warn")); assign(severity, resolve_rule_severity(policy_ref, severity_default)); assign(msg, {"code": result.code, "message": result.message, "path": result.path, "severity": severity}) }
# METADATA
# {"scope":"rule","title":"successes","description":"Returns all successful rule validation results."}
successes[msg] { assign(ref_codes, {code | some code in policy_refs}); assign(p_codes, {code | some problem in problems; assign(code, problem.code)}); assign(success_codes, minus(ref_codes, p_codes)); success_codes[code]; assign(msg, {"code": code}) }
# METADATA
# {"scope":"rule","title":"results","description":"Returns all successful and non-successful rule validation results."}
results[message] { assign(ref_codes, {code | some code in policy_refs}); assign(p_codes, {code | some problem in problems; assign(code, problem.code)}); ref_codes[code]; assign(messages, msg(code, p_codes)); messages[message] }
msg(code, p_codes) := msgs { p_codes[code]; assign(msgs, {msg | equal(problems[result].code, code); assign(msg, {"code": code, "message": result.message, "path": result.path, "severity": result.severity, "status": "failure"})}) }
msg(code, p_codes) := {message} { not p_codes[code]; assign(message, {"code": code, "status": "success"}) }
resolve_result_severity(result, _default) := severity { not result.severity; assign(severity, _default) }
resolve_result_severity(result, _default) := severity { assign(severity, result.severity) }
resolve_rule_severity(policy_ref, _default) := severity { not severity_overrides[policy_ref]; assign(severity, _default) }
resolve_rule_severity(policy_ref, _default) := severity { assign(severity, severity_overrides[policy_ref]) }