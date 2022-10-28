package openapi.lib

is_method_valid(method) {
	methods := {"get", "put", "post", "delete", "options", "head", "patch", "trace", "query"}
	methods[_] == method
}

format(meta, path) := result {
	result := merge_custom(
		meta,
		{
			"code": meta.title,
			"path": path,
			"message": extract_message(meta),
		},
	)
}

format_msg(meta, path, message) := result {
	result := merge_custom(meta, {
		"code": meta.title,
		"path": path,
		"message": message,
	})
}

merge_custom(meta, obj) := merged {
	not meta.custom
	merged := obj
}

merge_custom(meta, obj) := merged {
	merged := object.union(meta.custom, obj)
}

extract_message(meta) := msg {
	not meta.custom.message
	msg := meta.description
}

extract_message(meta) := msg {
	msg := meta.custom.message
}
