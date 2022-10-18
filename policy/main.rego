package main

import data.openapi

violation_operation_operationId_unique = proxy_policy("operation-operationId-unique")

violation_operation_success_response := proxy_policy("operation-success-response")

violation_operation_parameters := proxy_policy("operation-parameters")

exception[rules] {
	rules = [""]
}

proxy_policy(code) := [msg |
	result := openapi.policies[code].results[_]
	escaped := [segment | s := result.path[_]; segment := escape(s)]
	pointer := sprintf("#%s", [concat("/", escaped)])
	msg := {
		"msg": sprintf("%s [%s]", [result.message, pointer]),
		"details": {
			"code": result.code,
			"path": result.path,
		},
	}
]

escape(s) = t {
	t := replace(s, "/", "~1")
}

# warn[msg] {
# 	result := openapi.problems[_]
# 	result.severity == "warn"
# 	escaped := [segment | s := result.path[_]; segment := escape(s)]
# 	pointer := sprintf("#%s", [concat("/", escaped)])
# 	msg := {
# 		"msg": sprintf("%s [%s]", [result.message, pointer]),
# 		"details": {
# 			"code": result.code,
# 			"severity": result.severity,
# 			"path": result.path,
# 		},
# 	}
# }
# violation[msg] {
# 	result := openapi.problems[_]
# 	not result.severity == "warn"
# 	escaped := [segment | s := result.path[_]; segment := escape(s)]
# 	pointer := sprintf("#%s", [concat("/", escaped)])
# 	msg := {
# 		"msg": sprintf("%s [%s]", [result.message, pointer]),
# 		"details": {
# 			"code": result.code,
# 			"severity": result.severity,
# 			"path": result.path,
# 		},
# 	}
# }
# success := openapi.successes
