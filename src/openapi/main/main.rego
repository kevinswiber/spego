package openapi.main

import data.openapi

resolve_code(policy_ref) = code {
	code := policy_ref[0]
}

resolve_code(policy_ref) = code {
	not policy_ref[0]
	code := policy_ref
}

resolve_result_severity(result, _default) = severity {
	severity := result.severity
}

resolve_result_severity(result, _default) = severity {
	not result.severity
	severity := _default
}

resolve_severity(entry, _default) = severity {
	not entry[1]
	severity := _default
}

resolve_severity(entry, _default) = severity {
	severity := entry[1]
}

policy_refs := rs {
	not openapi.ruleset
	rs := {code |
		openapi.policies[code]
	}
}

policy_refs := openapi.ruleset

problems[msg] {
	policy_ref := policy_refs[_]
	code := resolve_code(policy_ref)
	result := openapi.policies[code].results[key]
	key.code == code

	severity_default := resolve_result_severity(result, "error")
	severity := resolve_severity(policy_ref, severity_default)

	msg := {
		"code": key.code,
		"message": key.message,
		"path": key.path,
		"severity": severity,
	}
}

successes := msg {
	ref_codes := {k | policy_ref := policy_refs[_]; k := resolve_code(policy_ref)}
	p_codes := {k | k := problems[_].code}
	msg := ref_codes - p_codes
}
