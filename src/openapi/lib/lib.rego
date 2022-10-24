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
		get_custom_or_default(meta),
		{
			"code": meta.title,
			"path": path,
		},
	)
}

format_msg(meta, path, message) := result {
	result = object.union(
		get_custom_or_default(meta),
		{
			"code": meta.title,
			"path": path,
			"message": message,
		},
	)
}

get_custom_or_default(meta) := custom {
	custom := meta.custom
}

get_custom_or_default(meta) := custom {
	custom := {}
}
