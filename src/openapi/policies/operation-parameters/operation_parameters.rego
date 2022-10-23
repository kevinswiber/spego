package openapi.policies["operation-parameters"]

import data.openapi.lib

# METADATA
# title: operation-parameters
# description: Operation parameters are unique and non-repeating.
results[lib.format_msg(rego.metadata.rule(), path, message)] {
	op := input.paths[p][m]
	lib.is_method_valid(m)
	path_parent := ["paths", p, m, "parameters"]
	params := op.parameters

	is_array(params)
	count(params) > 1

	dupe_results := get_dupe_results(params, path_parent)
	collision_results := get_body_formdata_collision_results(params, path_parent)
	ensured_body_param_results := get_ensure_one_body_param_results(params, path_parent)

	all_results := (dupe_results | collision_results) | ensured_body_param_results
	all_results[[path, message]]
}

get_dupe_results(params, path_parent) = dupe_results {
	dupes := union({{i1, i2} |
		params[i1].name == params[i2].name
		params[i1].in == params[i2].in
		not i1 == i2
	})

	dupe_results := {[dp, dm] |
		dm := "A parameter in this operation already exposes the same combination of \"name\" and \"in\" values."
		dupes[i]
		dp := array.concat(path_parent, [sprintf("%d", [i])])
	}
}

get_body_formdata_collision_results(params, path) = collision_results {
	msg := "Operation must not have both \"in:body\" and \"in:formData\" parameters."
	collision_results := {[p, m] |
		body_count := [i | params[i].in == "body"]
		formdata_count := [i | params[i].in == "formData"]

		count(body_count) > 0
		count(formdata_count) > 0

		p := path
		m := msg
	}
}

get_ensure_one_body_param_results(params, path_parent) = ensured_body_param_results {
	msg := "Operation must not have more than a single instance of the \"in:body\" parameter."
	ensured_body_param_results = {[p, m] |
		body_count := [i | params[i].in == "body"]

		count(body_count) > 1

		i := body_count[_]
		p := array.concat(path_parent, [sprintf("%d", [i])])
		m := msg
	}
}
