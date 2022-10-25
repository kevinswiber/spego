package openapi.main

test_recommended_policies_execute_by_default {
	a := results with input as {}
	count(a) == count(recommended_policy_refs)
}

test_recommended_policies_with_ruleset_by_default {
	ruleset := {"extends": ["spego:oas"]}
	a := results with input as {} with data.openapi.ruleset as ruleset
	count(a) == count(recommended_policy_refs)
}

test_recommended_policies_with_ruleset {
	ruleset := {"extends": [["spego:oas", "recommended"]]}
	a := results with input as {} with data.openapi.ruleset as ruleset
	count(a) == count(recommended_policy_refs)
}

test_all_policies_with_ruleset {
	ruleset := {"extends": [["spego:oas", "all"]]}
	a := results with input as {} with data.openapi.ruleset as ruleset
	count(a) == count(all_policy_refs)
}

test_ruleset_specifier_is_spectral_compatible {
	ruleset := {"extends": [["spectral:oas", "all"]]}
	a := results with input as {} with data.openapi.ruleset as ruleset
	count(a) == count(all_policy_refs)
}

test_off_policies_with_ruleset {
	ruleset := {"extends": [["spego:oas", "off"]]}
	a := results with input as {} with data.openapi.ruleset as ruleset
	count(a) == 0
}

test_enabled_policies_with_ruleset {
	ruleset := {
		"extends": [["spego:oas", "off"]],
		"rules": {"openapi-tags": true},
	}

	a := results with input as {} with data.openapi.ruleset as ruleset
	count(a) == 1
}

test_disabled_policies_with_ruleset {
	ruleset := {
		"extends": [["spego:oas", "all"]],
		"rules": {"openapi-tags": "off"},
	}

	a := results with input as {} with data.openapi.ruleset as ruleset
	count(a) == count(all_policy_refs) - 1
}

test_enabled_and_disabled_policies_with_ruleset {
	ruleset := {
		"extends": [["spego:oas", "recommended"]],
		"rules": {"openapi-tags": true, "path-params": "off"},
	}

	a := results with input as {} with data.openapi.ruleset as ruleset
	count(a) == count(recommended_policy_refs)
}

test_severity_override_with_ruleset {
	ruleset := {
		"extends": [["spego:oas", "all"]],
		"rules": {"openapi-tags": "info"},
	}

	result := {
		"code": "openapi-tags",
		"path": ["tags"],
		"message": "OpenAPI object must have non-empty \"tags\" array.",
		"severity": "info",
		"status": "failure",
	}
	results[result] with input as {} with data.openapi.ruleset as ruleset
}

test_results_includes_both_successes_and_problems {
	mock_input := {"paths": {"/users": {"get": {"responses": {"400": {}}}}}}
	ruleset := {"extends": ["spego:oas"]}

	problem_count := count(problems) with input as mock_input with data.openapi.ruleset as ruleset
	success_count := count(successes) with input as mock_input with data.openapi.ruleset as ruleset
	results_count := count(results) with input as mock_input with data.openapi.ruleset as ruleset

	problem_count > 0
	success_count > 0
	results_count == problem_count + success_count
}
