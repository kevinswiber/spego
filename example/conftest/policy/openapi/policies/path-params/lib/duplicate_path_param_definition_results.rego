package openapi.policies["path-params"].lib

import future.keywords.in

duplicate_path_param_definition_results(parameters, path_prefix) := {[path, message] | assign(path_params, named_path_params(parameters, path_prefix)); assign(dupes, {name: val | some [param, _] in path_params; name = param.name; assign(val, {index | some [param, index] in path_params; equal(name, param.name)}); gt(count(val), 1)}); dupes[n] = dupe_indexes; dupe_indexes[path]; assign(message, sprintf("Path parameter \"%s\" must not be defined multiple times.", [n]))} { true }