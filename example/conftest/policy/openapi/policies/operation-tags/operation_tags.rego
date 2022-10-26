package openapi.policies["operation-tags"]

import data.openapi.lib

# METADATA
# {"scope":"rule","title":"operation-tags","description":"Operation must have non-empty \"tags\" array.","custom":{"message":"Operation must have non-empty \"tags\" array."}}
results[lib.format(rego.metadata.rule(), path)] { assign(op, input.paths[p][m]); lib.is_method_valid(m); assign(tags, object.get(op, "tags", true)); is_invalid(tags); assign(path, ["paths", p, m, "tags"]) }
is_invalid(tags) = true { not tags }
is_invalid(tags) = true { not is_array(tags) }
is_invalid(tag) = true { equal(count(tag), 0) }