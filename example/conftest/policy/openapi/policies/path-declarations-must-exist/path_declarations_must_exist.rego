package openapi.policies["path-declarations-must-exist"]

import data.openapi.lib

# METADATA
# {"scope":"rule","title":"path-declarations-must-exist","description":"Path parameter declarations must not be empty, ex.\"/given/{}\" is invalid.","custom":{"message":"Path parameter declarations must not be empty, ex.\"/given/{}\" is invalid."}}
results[lib.format(rego.metadata.rule(), path)] { some path_key; input.paths[path_key]; contains(path_key, "{}"); assign(path, ["paths", path_key]) }