package openapi.policies["no-script-tags-in-markdown"]

import data.openapi.lib
import future.keywords.in

# METADATA
# {"scope":"rule","title":"no-script-tags-in-markdown","description":"Markdown descriptions must not have \"\u003cscript\u003e\" tags.","custom":{"message":"Markdown descriptions must not have \"\u003cscript\u003e\" tags."}}
results[lib.format(rego.metadata.rule(), path)] { assign(valid_props, {"description", "title"}); assign(titles_and_descriptions, {[md_path, md_val] | assign([current_path, value], walk(input)); some key; valid_props[key]; assign(md_val, value[key]); md_path = array.concat(current_path, [key])}); some [path, val] in titles_and_descriptions; contains(lower(val), "<script") }