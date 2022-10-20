package main

import data.openapi

escape(s) = t {
	t := replace(s, "/", "~1")
}

warn[msg] {
	result := openapi.problems[_]
	result.severity == "warn"
	escaped := [segment | s := result.path[_]; segment := escape(s)]
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
	result := openapi.problems[_]
	not result.severity == "warn"
	escaped := [segment | s := result.path[_]; segment := escape(s)]
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
