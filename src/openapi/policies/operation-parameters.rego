package openapi.policies["operation-parameters"]

import data.openapi.lib

# METADATA
# title: operation-parameters
# description: Operation parameters are unique and non-repeating.
# custom:
#   message: A parameter in this operation already exposes the same combination of "name" and "in" values.
results[lib.format(rego.metadata.rule(), path)] {
	op := input.paths[p][m]
	lib.is_method_valid(m)
	path_parent := ["paths", p, m, "parameters"]
	params := op.parameters

	is_array(params)
	count(params) > 1

	dupes := union({{i1, i2} |
		params[i1].name == params[i2].name
		params[i1].in == params[i2].in
		not i1 == i2
	})

	dupes[i]
	path := array.concat(path_parent, [sprintf("%d", [i])])
}

# METADATA
# title: operation-parameters
# description: Operation parameters are unique and non-repeating.
# custom:
#   message: Operation must not have both "in:body" and "in:formData" parameters.
results[lib.format(rego.metadata.rule(), path)] {
	op := input.paths[p][m]
	lib.is_method_valid(m)
	path := ["paths", p, m, "parameters"]
	params := op.parameters

	is_array(params)
	count(params) > 1

	body_count := [i | params[i].in == "body"]
	formdata_count := [i | params[i].in == "formData"]

	count(body_count) > 0
	count(formdata_count) > 0
}

# METADATA
# title: operation-parameters
# description: Operation parameters are unique and non-repeating.
# custom:
#   message: Operation must not have more than a single instance of the "in:body" parameter.
results[lib.format(rego.metadata.rule(), path)] {
	op := input.paths[p][m]
	lib.is_method_valid(m)
	path_parent := ["paths", p, m, "parameters"]
	params := op.parameters

	is_array(params)
	count(params) > 1

	body_count := [i | params[i].in == "body"]

	count(body_count) > 1

	i := body_count[_]
	path := array.concat(path_parent, [sprintf("%d", [i])])
}
