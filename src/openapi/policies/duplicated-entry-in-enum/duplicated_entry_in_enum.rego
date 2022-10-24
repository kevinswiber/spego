package openapi.policies["duplicated-entry-in-enum"]

import data.openapi.lib

# METADATA
# title: duplicated-entry-in-enum 
# description: Enum values must not have duplicate entry.
results[lib.format_msg(rego.metadata.rule(), path, message)] {
	enums := {[p, e] | some p, v, e; [p, v] = walk(input); e = v.enum}

	[p, e] = enums[_]
	e[i1] == e[i2]
	not i1 == i2

	path := array.concat(p, ["enum", sprintf("%d", [i1])])
	message := sprintf("Enum has duplicate value, \"%s\".", [e[i1]])
}
