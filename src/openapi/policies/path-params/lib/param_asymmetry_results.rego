package openapi.policies["path-params"].lib

import future.keywords.in

param_asymmetry_results(defined_params, path_key, path) := asymmetry_results {
	path_elements := {match |
		# regex.find_n is SDK-dependent and not working in Wasm.
		# all_matches := regex.find_n(path_regex, path_key, -1)
		all_matches := regex.find_all_string_submatch_n(path_regex, path_key, -1)

		some m in all_matches

		# regex.replace is SDK-dependent and not working in Wasm.
		# match := regex.replace(m, "[{}?*;]", "")
		match := regex_omit(m[0], "[{}?*;]")
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
