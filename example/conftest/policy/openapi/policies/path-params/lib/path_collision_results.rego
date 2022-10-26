package openapi.policies["path-params"].lib

import future.keywords.in

path_collision_results(paths_obj) := {[p, m] | assign(normalized_paths, [normalized | paths_obj[path]; assign(normalized, regex.replace(path, path_regex, "%"))]); assign(paths, [path | paths_obj[path]]); assign(dupes, [pair | some i1, i2; equal(normalized_paths[i1], normalized_paths[i2]); not equal(i1, i2); assign(pair, [i1, i2])]); some [i1, i2] in dupes; assign(m, sprintf("Paths \"%s\" and \"%s\" must not be equivalent.", [paths[i1], paths[i2]])); assign(p, ["paths", paths[i2]])} { true }