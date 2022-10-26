package openapi.main

severity_list := {"error", "hint", "info", "warn"} { true }
all_policy_refs := {code | data.openapi.policies[code]} { true }
policy_refs := refs { not data.openapi.ruleset; assign(refs, recommended_policy_refs) }
policy_refs := refs { assign(ruleset, data.openapi.ruleset); assign(refs, policy_refs_from_ruleset(ruleset)) }
ruleset_specifiers := {"spectral:oas", "spego:oas"} { true }
policy_refs_from_ruleset(ruleset) := refs { is_array(ruleset.extends); assign(specifier, ruleset.extends[0]); ruleset_specifiers[specifier]; assign(rec_refs, recommended_policy_refs); assign(enabled, enabled_ruleset_overrides(ruleset)); assign(disabled, disabled_ruleset_overrides(ruleset)); assign(refs, minus(or(rec_refs, enabled), disabled)) }
policy_refs_from_ruleset(ruleset) := refs { is_array(ruleset.extends); is_array(ruleset.extends[0]); assign([specifier, subset], ruleset.extends[0]); ruleset_specifiers[specifier]; assign(subset_map, {"all": all_policy_refs, "off": set(), "recommended": recommended_policy_refs}); assign(subset_refs, subset_map[subset]); assign(enabled, enabled_ruleset_overrides(ruleset)); assign(disabled, disabled_ruleset_overrides(ruleset)); assign(refs, minus(or(subset_refs, enabled), disabled)) }
enabled_ruleset_overrides(ruleset) := policy_refs { not ruleset.rules; assign(policy_refs, set()) }
enabled_ruleset_overrides(ruleset) := policy_refs { assign(rules, ruleset.rules); assign(valid_values, {true, "on"}); assign(policy_refs, {ref | assign(v, rules[ref]); valid_values[v]}) }
disabled_ruleset_overrides(ruleset) := policy_refs { not ruleset.rules; assign(policy_refs, set()) }
disabled_ruleset_overrides(ruleset) := policy_refs { assign(rules, ruleset.rules); assign(valid_values, {false, "off"}); assign(policy_refs, {ref | assign(v, rules[ref]); valid_values[v]}) }
severity_overrides := {code: sev | assign(rules, data.openapi.ruleset.rules); assign(sev, rules[code]); severity_list[sev]} { true }