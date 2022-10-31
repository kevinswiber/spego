module.exports = {
  "manifest": {
    "revision": "0.1.0",
    "roots": [
      "openapi/lib",
      "openapi/main",
      "openapi/policies"
    ]
  },
  "signatures_config": {},
  "namespaces": {
    "data.openapi.lib": [
      "../../src/openapi/lib/lib.rego"
    ],
    "data.openapi.main": [
      "../../src/openapi/main/conftest.rego",
      "../../src/openapi/main/main.rego",
      "../../src/openapi/main/main_test.rego",
      "../../src/openapi/main/recommended.rego",
      "../../src/openapi/main/ruleset.rego"
    ],
    "data.openapi.policies[\"contact-properties\"]": [
      "../../src/openapi/policies/contact-properties/contact_properties.rego",
      "../../src/openapi/policies/contact-properties/contact_properties_test.rego"
    ],
    "data.openapi.policies[\"duplicated-entry-in-enum\"]": [
      "../../src/openapi/policies/duplicated-entry-in-enum/duplicated_entry_in_enum.rego",
      "../../src/openapi/policies/duplicated-entry-in-enum/duplicated_entry_in_enum_test.rego"
    ],
    "data.openapi.policies[\"info-contact\"]": [
      "../../src/openapi/policies/info-contact/info_contact.rego",
      "../../src/openapi/policies/info-contact/info_contact_test.rego"
    ],
    "data.openapi.policies[\"info-description\"]": [
      "../../src/openapi/policies/info-description/info_description.rego",
      "../../src/openapi/policies/info-description/info_description_test.rego"
    ],
    "data.openapi.policies[\"info-license\"]": [
      "../../src/openapi/policies/info-license/info_license.rego",
      "../../src/openapi/policies/info-license/info_license_test.rego"
    ],
    "data.openapi.policies[\"license-url\"]": [
      "../../src/openapi/policies/license-url/license_url.rego",
      "../../src/openapi/policies/license-url/license_url_test.rego"
    ],
    "data.openapi.policies[\"no-eval-in-markdown\"]": [
      "../../src/openapi/policies/no-eval-in-markdown/no_eval_in_markdown.rego",
      "../../src/openapi/policies/no-eval-in-markdown/no_eval_in_markdown_test.rego"
    ],
    "data.openapi.policies[\"no-script-tags-in-markdown\"]": [
      "../../src/openapi/policies/no-script-tags-in-markdown/no_script_tags_in_markdown.rego",
      "../../src/openapi/policies/no-script-tags-in-markdown/no_script_tags_in_markdown_test.rego"
    ],
    "data.openapi.policies[\"openapi-tags\"]": [
      "../../src/openapi/policies/openapi-tags/openapi_tags.rego",
      "../../src/openapi/policies/openapi-tags/openapi_tags_test.rego"
    ],
    "data.openapi.policies[\"openapi-tags-uniqueness\"]": [
      "../../src/openapi/policies/openapi-tags-uniqueness/openapi_tags_uniqueness.rego",
      "../../src/openapi/policies/openapi-tags-uniqueness/openapi_tags_uniqueness_test.rego"
    ],
    "data.openapi.policies[\"operation-description\"]": [
      "../../src/openapi/policies/operation-description/operation_description.rego",
      "../../src/openapi/policies/operation-description/operation_description_test.rego"
    ],
    "data.openapi.policies[\"operation-operationId\"]": [
      "../../src/openapi/policies/operation-operationId/operation_operationid.rego",
      "../../src/openapi/policies/operation-operationId/operation_operationid_test.rego"
    ],
    "data.openapi.policies[\"operation-operationId-unique\"]": [
      "../../src/openapi/policies/operation-operationId-unique/operation_operationid_unique.rego",
      "../../src/openapi/policies/operation-operationId-unique/operation_operationid_unique_test.rego"
    ],
    "data.openapi.policies[\"operation-operationId-valid-in-url\"]": [
      "../../src/openapi/policies/operation-operationId-valid-in-url/operation_operationid_valid_in_url.rego",
      "../../src/openapi/policies/operation-operationId-valid-in-url/operation_operationid_valid_in_url_test.rego"
    ],
    "data.openapi.policies[\"operation-parameters\"]": [
      "../../src/openapi/policies/operation-parameters/operation_parameters.rego",
      "../../src/openapi/policies/operation-parameters/operation_parameters_test.rego"
    ],
    "data.openapi.policies[\"operation-singular-tag\"]": [
      "../../src/openapi/policies/operation-singular-tag/operation_singular_tag.rego",
      "../../src/openapi/policies/operation-singular-tag/operation_singular_tag_test.rego"
    ],
    "data.openapi.policies[\"operation-success-response\"]": [
      "../../src/openapi/policies/operation-success-response/operation_success_response.rego",
      "../../src/openapi/policies/operation-success-response/operation_success_response_test.rego"
    ],
    "data.openapi.policies[\"operation-tag-defined\"]": [
      "../../src/openapi/policies/operation-tag-defined/operation_tag_defined.rego",
      "../../src/openapi/policies/operation-tag-defined/operation_tag_defined_test.rego"
    ],
    "data.openapi.policies[\"operation-tags\"]": [
      "../../src/openapi/policies/operation-tags/operation_tags.rego",
      "../../src/openapi/policies/operation-tags/operation_tags_test.rego"
    ],
    "data.openapi.policies[\"path-declarations-must-exist\"]": [
      "../../src/openapi/policies/path-declarations-must-exist/path_declarations_must_exist.rego",
      "../../src/openapi/policies/path-declarations-must-exist/path_declarations_must_exist_test.rego"
    ],
    "data.openapi.policies[\"path-keys-no-trailing-slash\"]": [
      "../../src/openapi/policies/path-keys-no-trailing-slash/path_keys_no_trailing_slash.rego",
      "../../src/openapi/policies/path-keys-no-trailing-slash/path_keys_no_trailing_slash_test.rego"
    ],
    "data.openapi.policies[\"path-not-include-query\"]": [
      "../../src/openapi/policies/path-not-include-query/path_not_include_query.rego",
      "../../src/openapi/policies/path-not-include-query/path_not_include_query_test.rego"
    ],
    "data.openapi.policies[\"path-params\"]": [
      "../../src/openapi/policies/path-params/path_params.rego",
      "../../src/openapi/policies/path-params/path_params_test.rego"
    ],
    "data.openapi.policies[\"path-params\"].lib": [
      "../../src/openapi/policies/path-params/lib/duplicate_path_param_definition_results.rego",
      "../../src/openapi/policies/path-params/lib/duplicate_var_name_in_path_results.rego",
      "../../src/openapi/policies/path-params/lib/lib.rego",
      "../../src/openapi/policies/path-params/lib/param_asymmetry_results.rego",
      "../../src/openapi/policies/path-params/lib/path_collision_results.rego",
      "../../src/openapi/policies/path-params/lib/path_param_missing_required_results.rego",
      "../../src/openapi/policies/path-params/lib/path_regex.rego"
    ],
    "data.openapi.policies[\"tag-description\"]": [
      "../../src/openapi/policies/tag-description/tag_description.rego",
      "../../src/openapi/policies/tag-description/tag_description_test.rego"
    ]
  },
  "annotations": [
    {
      "location": {
        "file": "../../src/openapi/main/conftest.rego",
        "row": 30,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "main"
        },
        {
          "type": "string",
          "value": "violation"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "violation",
        "description": "Conftest-compatible violation rule."
      }
    },
    {
      "location": {
        "file": "../../src/openapi/main/main.rego",
        "row": 9,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "main"
        },
        {
          "type": "string",
          "value": "problems"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "problems",
        "description": "Returns all non-successful rule validation results."
      }
    },
    {
      "location": {
        "file": "../../src/openapi/main/main.rego",
        "row": 39,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "main"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "results",
        "description": "Returns all successful and non-successful rule validation results."
      }
    },
    {
      "location": {
        "file": "../../src/openapi/main/main.rego",
        "row": 28,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "main"
        },
        {
          "type": "string",
          "value": "successes"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "successes",
        "description": "Returns all successful rule validation results."
      }
    },
    {
      "location": {
        "file": "../../src/openapi/main/conftest.rego",
        "row": 12,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "main"
        },
        {
          "type": "string",
          "value": "warn"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "warn",
        "description": "Conftest-compatible warn rule."
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/contact-properties/contact_properties.rego",
        "row": 10,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "contact-properties"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "contact-properties",
        "description": "Contact object must have \"name\", \"url\" and \"email\".",
        "custom": {
          "recommended": false
        }
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/duplicated-entry-in-enum/duplicated_entry_in_enum.rego",
        "row": 11,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "duplicated-entry-in-enum"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "duplicated-entry-in-enum",
        "description": "Enum values must not have duplicate entry.",
        "custom": {
          "recommended": true
        }
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/info-contact/info_contact.rego",
        "row": 10,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "info-contact"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "info-contact",
        "description": "Info object must have \"contact\" object.",
        "custom": {
          "recommended": true
        }
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/info-description/info_description.rego",
        "row": 10,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "info-description"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "info-description",
        "description": "Info \"description\" must be present and non-empty string.",
        "custom": {
          "recommended": true
        }
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/info-license/info_license.rego",
        "row": 10,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "info-license"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "info-license",
        "description": "Info object must have \"license\" object.",
        "custom": {
          "recommended": false
        }
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/license-url/license_url.rego",
        "row": 10,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "license-url"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "license-url",
        "description": "License object must include \"url\".",
        "custom": {
          "recommended": false
        }
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/no-eval-in-markdown/no_eval_in_markdown.rego",
        "row": 11,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "no-eval-in-markdown"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "no-eval-in-markdown",
        "description": "Markdown descriptions must not have \"eval(\".",
        "custom": {
          "recommended": true
        }
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/no-script-tags-in-markdown/no_script_tags_in_markdown.rego",
        "row": 11,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "no-script-tags-in-markdown"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "no-script-tags-in-markdown",
        "description": "Markdown descriptions must not have \"\u003cscript\u003e\" tags.",
        "custom": {
          "recommended": true
        }
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/openapi-tags/openapi_tags.rego",
        "row": 10,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "openapi-tags"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "openapi-tags",
        "description": "OpenAPI object must have non-empty \"tags\" array.",
        "custom": {
          "recommended": false
        }
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/openapi-tags-uniqueness/openapi_tags_uniqueness.rego",
        "row": 11,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "openapi-tags-uniqueness"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "openapi-tags-uniqueness",
        "description": "Each tag must have a unique name.",
        "custom": {
          "recommended": true
        }
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/operation-description/operation_description.rego",
        "row": 10,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "operation-description"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "operation-description",
        "description": "Operation \"description\" must be present and non-empty string.",
        "custom": {
          "recommended": true
        }
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/operation-operationId/operation_operationid.rego",
        "row": 10,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "operation-operationId"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "operation-operationId",
        "description": "Operation must have \"operationId\".",
        "custom": {
          "recommended": true
        }
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/operation-operationId-unique/operation_operationid_unique.rego",
        "row": 16,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "operation-operationId-unique"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "operation-operationId-unique",
        "description": "Every operation must have unique \"operationId\".",
        "custom": {
          "message": "operationId must be unique",
          "recommended": true,
          "severity": "error"
        }
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/operation-operationId-valid-in-url/operation_operationid_valid_in_url.rego",
        "row": 10,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "operation-operationId-valid-in-url"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "operation-operationId-valid-in-url",
        "description": "operationId must not have characters that are invalid when used in URL.",
        "custom": {
          "recommended": true
        }
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/operation-parameters/operation_parameters.rego",
        "row": 10,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "operation-parameters"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "operation-parameters",
        "description": "Operation parameters are unique and non-repeating.",
        "custom": {
          "recommended": true
        }
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/operation-singular-tag/operation_singular_tag.rego",
        "row": 10,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "operation-singular-tag"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "operation-singular-tag",
        "description": "Operation must not have more than a singular tag.",
        "custom": {
          "recommended": false
        }
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/operation-success-response/operation_success_response.rego",
        "row": 10,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "operation-success-response"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "operation-success-response",
        "description": "Operation must have at least one \"2xx\" or \"3xx\" response.",
        "custom": {
          "recommended": true
        }
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/operation-tag-defined/operation_tag_defined.rego",
        "row": 11,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "operation-tag-defined"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "operation-tag-defined",
        "description": "Operation tags must be defined in global tags.",
        "custom": {
          "recommended": true
        }
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/operation-tags/operation_tags.rego",
        "row": 10,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "operation-tags"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "operation-tags",
        "description": "Operation must have non-empty \"tags\" array.",
        "custom": {
          "recommended": true
        }
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/path-declarations-must-exist/path_declarations_must_exist.rego",
        "row": 10,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "path-declarations-must-exist"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "path-declarations-must-exist",
        "description": "Path parameter declarations must not be empty, ex.\"/given/{}\" is invalid.",
        "custom": {
          "recommended": true
        }
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/path-keys-no-trailing-slash/path_keys_no_trailing_slash.rego",
        "row": 10,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "path-keys-no-trailing-slash"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "path-keys-no-trailing-slash",
        "description": "Path must not end with slash.",
        "custom": {
          "recommended": true
        }
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/path-not-include-query/path_not_include_query.rego",
        "row": 10,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "path-not-include-query"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "path-not-include-query",
        "description": "Path must not include query string.",
        "custom": {
          "recommended": true
        }
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/path-params/path_params.rego",
        "row": 12,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "path-params"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "path-params",
        "description": "Path parameters must be defined and valid.",
        "custom": {
          "recommended": true,
          "severity": "error"
        }
      }
    },
    {
      "location": {
        "file": "../../src/openapi/policies/tag-description/tag_description.rego",
        "row": 10,
        "col": 1
      },
      "path": [
        {
          "type": "var",
          "value": "data"
        },
        {
          "type": "string",
          "value": "openapi"
        },
        {
          "type": "string",
          "value": "policies"
        },
        {
          "type": "string",
          "value": "tag-description"
        },
        {
          "type": "string",
          "value": "results"
        }
      ],
      "annotations": {
        "scope": "rule",
        "title": "tag-description",
        "description": "Tag object must have \"description\".",
        "custom": {
          "recommended": false
        }
      }
    }
  ]
};
