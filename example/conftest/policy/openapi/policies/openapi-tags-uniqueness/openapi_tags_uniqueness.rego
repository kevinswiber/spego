package openapi.policies["openapi-tags-uniqueness"]

import data.openapi.lib
import future.keywords.in

# METADATA
# {"scope":"rule","title":"openapi-tags-uniqueness","description":"Each tag must have a unique name."}
results[lib.format_msg(rego.metadata.rule(), path, message)] { assign(tags, input.tags); assign(dupes, {tagName: indexes | some tag in tags; assign(tagName, tag.name); assign(indexes, {index | some index, inner_tag in tags; equal(inner_tag.name, tagName)}); gt(count(indexes), 1)}); some name, index; assign(indexes, dupes[name]); indexes[index]; assign(path, ["tags", sprintf("%d", [index])]); assign(message, sprintf("\"tags\" object contains duplicate tag name \"%s\".", [name])) }