package openapi.policies["duplicated-entry-in-enum"]

import data.openapi.lib
import future.keywords.in

# METADATA
# title: duplicated-entry-in-enum 
# description: Enum values must not have duplicate entry.
# custom:
#   recommended: true
results[lib.format_msg(rego.metadata.rule(), path, message)] {
	enums := {[current_path, enum] |
		some value
		[current_path, value] = walk(input)
		enum = value.enum
	}

	some [found_path, enum] in enums

	some i1, i2
	enum[i1] == enum[i2]

	not i1 == i2

	path := array.concat(found_path, ["enum", sprintf("%d", [i1])])
	message := sprintf("Enum has duplicate value, \"%s\".", [enum[i1]])
}
