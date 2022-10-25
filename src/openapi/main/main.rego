package openapi.main

import data.openapi.lib

resolve_code(policy_ref) := code {
	code := policy_ref[0]
}

resolve_code(policy_ref) := code {
	not policy_ref[0]
	code := policy_ref
}

resolve_result_severity(result, _default) := severity {
	severity := result.severity
}

resolve_result_severity(result, _default) := severity {
	not result.severity
	severity := _default
}

resolve_severity(entry, _default) := severity {
	not entry[1]
	severity := _default
}

resolve_severity(entry, _default) := severity {
	severity := entry[1]
}

policy_refs := rs {
	not data.openapi.ruleset
	rs := {code |
		data.openapi.policies[code]
	}
}

recommended := [
	"operation-success-response",
	"operation-operationId-unique",
	"operation-parameters",
	"operation-tag-defined",
	"path-params",
	"duplicated-entry-in-enum",
	"info-contact",
	"info-description",
	"no-eval-in-markdown",
	"no-script-tags-in-markdown",
	"openapi-tags-uniqueness",
	"operation-description",
]

policy_refs := data.openapi.ruleset

# METADATA
# title: problems
# description: Returns all non-successful rule validation results.
problems[msg] {
	policy_ref := policy_refs[_]
	code := resolve_code(policy_ref)
	data.openapi.policies[code].results[result]
	result.code == code

	severity_default := resolve_result_severity(result, "warn")
	severity := resolve_severity(policy_ref, severity_default)

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

get_msg(code, p_codes) := msgs {
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

get_msg(code, p_codes) := {msg} {
	not p_codes[code]
	msg := {
		"code": code,
		"status": "success",
	}
}

warn[msg] {
	problems[result]
	result.severity == "warn"
	escaped := [segment | s := result.path[_]; segment := lib.escape(s)]
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
	problems[result]
	result.severity == "error"
	escaped := [segment | s := result.path[_]; segment := lib.escape(s)]
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
