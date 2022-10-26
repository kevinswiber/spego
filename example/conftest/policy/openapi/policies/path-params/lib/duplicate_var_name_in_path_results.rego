package openapi.policies["path-params"].lib

import future.keywords.in

duplicate_var_name_in_path_results(path_key) := {[path, message] | assign(path, ["paths", path_key]); assign(matches, [match | assign(all_matches, regex.find_n(path_regex, path_key, -1)); some m in all_matches; assign(match, regex.replace(m, "[{}?*;]", ""))]); assign(dupes, {match | some i1, i2; equal(matches[i1], matches[i2]); not equal(i1, i2); match = matches[i1]}); dupes[dupe]; assign(message, sprintf("Path \"%s\" must not use parameter \"{%s}\" multiple times.", [path_key, dupe]))} { true }