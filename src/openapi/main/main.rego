package openapi.main

import data.openapi.lib
import future.keywords.in

# METADATA
# title: problems
# description: Returns all non-successful rule validation results.
problems[msg] {
	policy_refs[policy_ref]
	data.openapi.policies[policy_ref].results[result]
	result.code == policy_ref

	severity_default := lib.resolve_result_severity(result, "warn")
	severity := lib.resolve_rule_severity(policy_ref, severity_default, severity_overrides)

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
	p_map := {code: results |
		some result in problems
		code := result.code
		results := {inner_result |
			problems[inner_result]
			inner_result.code == code
		}
	}

	ref_codes[code]
	messages := lib.msg(code, p_map)
	messages[message]
}
