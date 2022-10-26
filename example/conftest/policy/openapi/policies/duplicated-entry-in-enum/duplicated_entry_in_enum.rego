package openapi.policies["duplicated-entry-in-enum"]

import data.openapi.lib
import future.keywords.in

# METADATA
# {"scope":"rule","title":"duplicated-entry-in-enum","description":"Enum values must not have duplicate entry."}
results[lib.format_msg(rego.metadata.rule(), path, message)] { assign(enums, {[current_path, enum] | some value; [current_path, value] = walk(input); enum = value.enum}); some [found_path, enum] in enums; some i1, i2; equal(enum[i1], enum[i2]); not equal(i1, i2); assign(path, array.concat(found_path, ["enum", sprintf("%d", [i1])])); assign(message, sprintf("Enum has duplicate value, \"%s\".", [enum[i1]])) }