package openapi.policies["no-eval-in-markdown"]

test_eval_in_markdown_title_fails {
	result := {
		"code": "no-eval-in-markdown",
		"path": ["info", "title"],
		"message": "Markdown descriptions must not have \"eval(\".",
	}

	results[result] with input as {"info": {"title": "hi eval(\"alert('hi')\") there"}}
}

test_eval_in_markdown_description_fails {
	result := {
		"code": "no-eval-in-markdown",
		"path": ["info", "description"],
		"message": "Markdown descriptions must not have \"eval(\".",
	}

	results[result] with input as {"info": {"description": "hi eval(\"alert('hi')\") there"}}
}

test_eval_in_markdown_title_and_description_fails {
	mock_input := {"info": {
		"title": "hi eval(\"alert('hi')\") there",
		"description": "hi eval(\"alert('hi')\") there",
	}}

	result1 := {
		"code": "no-eval-in-markdown",
		"path": ["info", "title"],
		"message": "Markdown descriptions must not have \"eval(\".",
	}

	result2 := {
		"code": "no-eval-in-markdown",
		"path": ["info", "description"],
		"message": "Markdown descriptions must not have \"eval(\".",
	}

	res := results with input as mock_input
	res[result1]
	res[result2]
}

test_no_eval_in_markdown_title_succeeds {
	a := results with input as {"info": {"title": "hi"}}
	count(a) == 0
}

test_no_eval_in_markdown_description_succeeds {
	a := results with input as {"info": {"description": "hi"}}
	count(a) == 0
}
