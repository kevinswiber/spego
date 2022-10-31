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
	custom := object.remove(meta.custom, ["recommended"])
	merged := object.union(custom, obj)
}

extract_message(meta) := msg {
	not meta.custom.message
	msg := meta.description
}

extract_message(meta) := msg {
	msg := meta.custom.message
}

msg(code, p_map) := msgs {
	p_map[code]
	msgs := {msg |
		p_map[code][result]
		msg := {
			"code": code,
			"message": result.message,
			"path": result.path,
			"severity": result.severity,
			"status": "failure",
		}
	}
}

msg(code, p_map) := {message} {
	not p_map[code]
	message := {
		"code": code,
		"status": "success",
	}
}

resolve_result_severity(result, _default) := severity {
	not result.severity
	severity := _default
}

resolve_result_severity(result, _default) := severity {
	severity := result.severity
}

resolve_rule_severity(policy_ref, _default, severity_overrides) := severity {
	not severity_overrides[policy_ref]
	severity := _default
}

resolve_rule_severity(policy_ref, _default, severity_overrides) := severity {
	severity := severity_overrides[policy_ref]
}
