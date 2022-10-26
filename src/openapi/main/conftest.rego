package openapi.main

import future.keywords.in

escape(s) := t {
	t := replace(s, "/", "~1")
}

# METADATA
# title: warn
# description: Conftest-compatible warn rule.
warn[msg] {
	problems[result]
	result.severity == "warn"
	escaped := [segment | some s in result.path; segment := escape(s)]
	pointer := sprintf("%s", [concat("/", escaped)])
	msg := {
		"msg": sprintf("%s - %s [%s]", [result.code, result.message, pointer]),
		"details": {
			"code": result.code,
			"severity": result.severity,
			"path": result.path,
		},
	}
}

# METADATA
# title: violation 
# description: Conftest-compatible violation rule.
violation[msg] {
	problems[result]
	result.severity == "error"
	escaped := [segment | some s in result.path; segment := escape(s)]
	pointer := sprintf("%s", [concat("/", escaped)])
	msg := {
		"msg": sprintf("%s - %s [%s]", [result.code, result.message, pointer]),
		"details": {
			"code": result.code,
			"severity": result.severity,
			"path": result.path,
		},
	}
}
