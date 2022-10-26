package openapi.policies["tag-description"]

import data.openapi.lib

# METADATA
# {"scope":"rule","title":"tag-description","description":"Tag object must have \"description\".","custom":{"message":"Tag object must have \"description\"."}}
results[lib.format(rego.metadata.rule(), path)] { assign(tags, input.tags); some i; tags[i]; not tags[i].description; assign(path, ["tags", sprintf("%d", [i])]) }