package openapi.main

severity_list := {"error", "warn", "info", "hint"}

all_policy_refs := {code | data.openapi.policies[code]}

policy_refs := refs {
	not data.openapi.ruleset
	refs := recommended_policy_refs
}

policy_refs := refs {
	ruleset := data.openapi.ruleset
	refs := policy_refs_from_ruleset(ruleset)
}

ruleset_specifiers := {"spego:oas", "spectral:oas"}

policy_refs_from_ruleset(ruleset) := refs {
	is_array(ruleset.extends)
	specifier := ruleset.extends[0]
	ruleset_specifiers[specifier]
	rec_refs := recommended_policy_refs
	enabled := enabled_ruleset_overrides(ruleset)
	disabled := disabled_ruleset_overrides(ruleset)
	refs := (rec_refs | enabled) - disabled
}

policy_refs_from_ruleset(ruleset) := refs {
	is_array(ruleset.extends)
	is_array(ruleset.extends[0])
	[specifier, subset] := ruleset.extends[0]
	ruleset_specifiers[specifier]

	subset_map := {
		"recommended": recommended_policy_refs,
		"all": all_policy_refs,
		"off": set(),
	}

	subset_refs := subset_map[subset]
	enabled := enabled_ruleset_overrides(ruleset)
	disabled := disabled_ruleset_overrides(ruleset)
	refs := (subset_refs | enabled) - disabled
}

enabled_ruleset_overrides(ruleset) := policy_refs {
	not ruleset.rules
	policy_refs := set()
}

enabled_ruleset_overrides(ruleset) := policy_refs {
	rules := ruleset.rules
	valid_values := {true, "on"}
	policy_refs := {ref |
		v := rules[ref]
		valid_values[v]
	}
}

disabled_ruleset_overrides(ruleset) := policy_refs {
	not ruleset.rules
	policy_refs := set()
}

disabled_ruleset_overrides(ruleset) := policy_refs {
	rules := ruleset.rules
	valid_values := {false, "off"}
	policy_refs := {ref |
		v := rules[ref]
		valid_values[v]
	}
}

severity_overrides := {code: sev |
	rules := data.openapi.ruleset.rules
	sev := rules[code]
	severity_list[sev]
}
