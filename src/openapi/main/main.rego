package openapi.main

import future.keywords.in

# METADATA
# title: problems
# description: Returns all non-successful rule validation results.
problems[msg] {
	policy_refs[policy_ref]
	data.openapi.policies[policy_ref].results[result]
	result.code == policy_ref

	severity_default := resolve_result_severity(result, "warn")
	severity := resolve_rule_severity(policy_ref, severity_default)

	msg := {
		"code": result.code,
		"message": result.message,
		"path": result.path,
		"severity": severity,
	}
}

# METADATA
# title: successes 
# description: Returns all successful rule validation results.
successes[msg] {
	ref_codes := {code | some code in policy_refs}
	p_codes := {code | some problem in problems; code := problem.code}
	success_codes := ref_codes - p_codes
	success_codes[code]
	msg := {"code": code}
}

# METADATA
# title: results
# description: Returns all successful and non-successful rule validation results.
results[message] {
	ref_codes := {code | some code in policy_refs}
	p_codes := {code | some problem in problems; code := problem.code}

	ref_codes[code]
	messages := msg(code, p_codes)
	messages[message]
}

msg(code, p_codes) := msgs {
	p_codes[code]
	msgs := {msg |
		problems[result].code == code
		msg := {
			"code": code,
			"message": result.message,
			"path": result.path,
			"severity": result.severity,
			"status": "failure",
		}
	}
}

msg(code, p_codes) := {message} {
	not p_codes[code]
	message := {
		"code": code,
		"status": "success",
	}
}

resolve_result_severity(result, _default) := severity {
	not result.severity
	severity := _default
}

resolve_result_severity(result, _default) := severity {
	severity := result.severity
}

resolve_rule_severity(policy_ref, _default) := severity {
	not severity_overrides[policy_ref]
	severity := _default
}

resolve_rule_severity(policy_ref, _default) := severity {
	severity := severity_overrides[policy_ref]
}
