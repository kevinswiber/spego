package openapi.lib

is_method_valid(method) = true { assign(methods, {"delete", "get", "head", "options", "patch", "post", "put", "query", "trace"}); equal(methods[_], method) }
format(meta, path) := result { assign(result, merge_custom(meta, {"code": meta.title, "path": path})) }
format_msg(meta, path, message) := result { assign(result, merge_custom(meta, {"code": meta.title, "message": message, "path": path})) }
merge_custom(meta, obj) := merged { not meta.custom; assign(merged, obj) }
merge_custom(meta, obj) := merged { assign(merged, object.union(meta.custom, obj)) }