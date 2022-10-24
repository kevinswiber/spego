package openapi.policies["path-params"].lib

get_param_asymmetry_results(defined_params, path_key, path) := asymmetry_results {
	path_elements := {match |
		all_matches := regex.find_n(path_regex, path_key, -1)
		m := all_matches[_]
		match := regex.replace(m, "[{}?*;]", "")
	}

	unused_path_param_results := {[p, m] |
		defined_params[param]
		not path_elements[param]

		p := param[1]
		m := sprintf("Parameter \"%s\" must be used in path \"%s\".", [param[0].name, path_key])
	}

	undefined_path_param_results := {[p, m] |
		defined_names := {name |
			name := defined_params[_].name
		}

		path_elements[element_name]
		not defined_names[element_name]

		p := path
		m := sprintf("Operation must define parameter \"{%s}\" as expected by path \"%s\".", [element_name, path_key])
	}

	asymmetry_results := unused_path_param_results | undefined_path_param_results
}
