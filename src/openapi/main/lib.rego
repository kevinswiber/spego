package openapi.main.lib

has_key(x, k) {
	_ = x[k]
}

is_method_valid(method) {
	methods := {"get", "put", "post", "delete", "options", "head", "patch", "trace", "query"}
	methods[_] == method
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
