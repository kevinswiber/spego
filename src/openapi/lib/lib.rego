package openapi.lib

is_method_valid(method) {
	methods := {"get", "put", "post", "delete", "options", "head", "patch", "trace", "query"}
	methods[_] == method
}

escape(s) := t {
	t := replace(s, "/", "~1")
}

format(meta, path) := result {
	result = object.union(
		{
			"code": meta.title,
			"path": path,
		},
		meta.custom,
	)
}

format_msg(meta, path, message) := result {
	result = object.union(
		meta.custom,
		{
			"code": meta.title,
			"path": path,
			"message": message,
		},
	)
}
