package openapi.main

test_all_policies_execute_by_default {
	a := results with input as {}
	count(a) == count(data.openapi.policies)
}

test_limited_policies_with_ruleset {
	ruleset := [
		"operation-success-response",
		"operation-tag-defined",
	]
	a := results with input as {} with data.openapi.ruleset as ruleset
	count(a) == count(ruleset)
}

test_results_includes_both_successes_and_problems {
	mock_input := {"paths": {"/users": {"get": {"responses": {"400": {}}}}}}
	ruleset := [
		"operation-success-response",
		"operation-tag-defined",
	]

	problem_count := count(problems) with input as mock_input with data.openapi.ruleset as ruleset
	success_count := count(successes) with input as mock_input with data.openapi.ruleset as ruleset
	results_count := count(results) with input as mock_input with data.openapi.ruleset as ruleset

	problem_count == 1
	success_count == 1
	results_count == count(ruleset)
}
