package openapi.main.lib

has_key(x, k) {
	_ = x[k]
}

is_method_valid(method) {
	methods := {"get", "put", "post", "delete", "options", "head", "patch", "trace", "query"}
	methods[_] == method
}

op_has_success_code(responses) {
	responses["2xx"]
}

op_has_success_code(responses) {
	responses["3xx"]
}

op_has_success_code(responses) {
	success_codes := [code |
		responses[code]
		k := to_number(code)
		k >= 200
		k < 400
	]
	count(success_codes) > 0
}

escape(s) = t {
	t := replace(s, "/", "~1")
}

format(meta, path) := {
	"code": meta.title,
	"path": path,
	"message": meta.custom.message,
}

format_msg(meta, path, message) := {
	"code": meta.title,
	"path": path,
	"message": message,
}
