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

# METADATA
# title: problems
# description: Returns all non-successful rule validation results.
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

# METADATA
# title: successes 
# description: Returns all successful rule validation results.
successes[msg] {
	ref_codes := {k | policy_ref := policy_refs[_]; k := resolve_code(policy_ref)}
	p_codes := {k | k := problems[_].code}
	success_codes := ref_codes - p_codes
	success_codes[code]
	msg := {"code": code}
}

# METADATA
# title: results
# description: Returns all successful and non-successful rule validation results.
results[msg] {
	ref_codes := {k | policy_ref := policy_refs[_]; k := resolve_code(policy_ref)}
	p_codes := {k | k := problems[_].code}
	s_codes := {k | k := successes[_].code}

	ref_codes[code]
	messages := get_msg(code, p_codes)
	messages[msg]
}

get_msg(code, p_codes) = msgs {
	p_codes[code]
	msgs := {msg |
		problems[key].code == code
		msg := {
			"code": code,
			"message": key.message,
			"path": key.path,
			"severity": key.severity,
			"status": "failure",
		}
	}
}

get_msg(code, p_codes) = {msg} {
	not p_codes[code]
	msg := {
		"code": code,
		"status": "success",
	}
}

warn[msg] {
	result := openapi.main.problems[_]
	result.severity == "warn"
	escaped := [segment | s := result.path[_]; segment := openapi.main.lib.escape(s)]
	pointer := sprintf("#%s", [concat("/", escaped)])
	msg := {
		"msg": sprintf("%s [%s]", [result.message, pointer]),
		"details": {
			"code": result.code,
			"severity": result.severity,
			"path": result.path,
		},
	}
}

violation[msg] {
	result := openapi.main.problems[_]
	not result.severity == "warn"
	escaped := [segment | s := result.path[_]; segment := openapi.main.lib.escape(s)]
	pointer := sprintf("#%s", [concat("/", escaped)])
	msg := {
		"msg": sprintf("%s [%s]", [result.message, pointer]),
		"details": {
			"code": result.code,
			"severity": result.severity,
			"path": result.path,
		},
	}
}
