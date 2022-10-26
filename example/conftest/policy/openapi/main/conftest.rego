package openapi.main

import future.keywords.in

escape(s) := t { assign(t, replace(s, "/", "~1")) }
# METADATA
# {"scope":"rule","title":"warn","description":"Conftest-compatible warn rule."}
warn[msg] { problems[result]; equal(result.severity, "warn"); assign(escaped, [segment | some s in result.path; assign(segment, escape(s))]); assign(pointer, sprintf("%s", [concat("/", escaped)])); assign(msg, {"details": {"code": result.code, "path": result.path, "severity": result.severity}, "msg": sprintf("%s - %s [%s]", [result.code, result.message, pointer])}) }
# METADATA
# {"scope":"rule","title":"violation","description":"Conftest-compatible violation rule."}
violation[msg] { problems[result]; equal(result.severity, "error"); assign(escaped, [segment | some s in result.path; assign(segment, escape(s))]); assign(pointer, sprintf("%s", [concat("/", escaped)])); assign(msg, {"details": {"code": result.code, "path": result.path, "severity": result.severity}, "msg": sprintf("%s - %s [%s]", [result.code, result.message, pointer])}) }