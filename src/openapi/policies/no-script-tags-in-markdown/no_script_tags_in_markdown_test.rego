package openapi.policies["no-script-tags-in-markdown"]

test_script_tag_in_markdown_title_fails {
	result := {
		"code": "no-script-tags-in-markdown",
		"path": ["info", "title"],
		"message": "Markdown descriptions must not have \"<script>\" tags.",
	}

	results[result] with input as {"info": {"title": "hi <script>alert('hi')</script> there"}}
}

test_script_tag_in_markdown_description_fails {
	result := {
		"code": "no-script-tags-in-markdown",
		"path": ["info", "description"],
		"message": "Markdown descriptions must not have \"<script>\" tags.",
	}

	results[result] with input as {"info": {"description": "hi <script>alert('hi')</script> there"}}
}

test_script_tag_in_markdown_title_and_description_fails {
	mock_input := {"info": {
		"title": "hi <script>alert('hi')</script> there",
		"description": "hi <script>alert('hi')</script> there",
	}}

	result1 := {
		"code": "no-script-tags-in-markdown",
		"path": ["info", "title"],
		"message": "Markdown descriptions must not have \"<script>\" tags.",
	}

	result2 := {
		"code": "no-script-tags-in-markdown",
		"path": ["info", "description"],
		"message": "Markdown descriptions must not have \"<script>\" tags.",
	}

	res := results with input as mock_input

	res[result1]
	res[result2]
}

test_no_script_tag_in_markdown_title_succeeds {
	a := results with input as {"info": {"title": "hi"}}
	count(a) == 0
}

test_no_script_tag_in_markdown_description_succeeds {
	a := results with input as {"info": {"description": "hi"}}
	count(a) == 0
}
