package openapi.policies["openapi-tags"]

import data.openapi.lib

# METADATA
# {"scope":"rule","title":"openapi-tags","description":"OpenAPI object must have non-empty \"tags\" array.","custom":{"message":"OpenAPI object must have non-empty \"tags\" array."}}
results[lib.format(rego.metadata.rule(), path)] { assign(tags, object.get(input, "tags", true)); is_invalid(tags); assign(path, ["tags"]) }
is_invalid(tags) = true { not tags; true }
is_invalid(tags) = true { assign(is_tags_array, is_array(tags)); not is_tags_array }
is_invalid(tags) = true { equal(count(tags), 0) }