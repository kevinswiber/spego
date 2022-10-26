package openapi.policies["path-keys-no-trailing-slash"]

import data.openapi.lib

# METADATA
# {"scope":"rule","title":"path-keys-no-trailing-slash","description":"Path must not end with slash.","custom":{"message":"Path must not end with slash."}}
results[lib.format(rego.metadata.rule(), path)] { some path_key; input.paths[path_key]; endswith(path_key, "/"); assign(path, ["paths", path_key]) }