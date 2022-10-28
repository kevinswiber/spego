# spego

[![bundle](https://github.com/kevinswiber/spego/actions/workflows/test.yaml/badge.svg)](https://github.com/kevinswiber/spego/actions/workflows/test.yaml)

A set of policies for Open Policy Agent to validate OpenAPI definitions.

- Use `opa eval` to execute policies against OpenAPI documents
- Built-in support for [Conftest](https://conftest.dev)
- Based on the rules used by [Spectral](https://github.com/stoplightio/spectral).

## Usage

Spego may be used as an Open Policy Agent (OPA) bundle. First, be sure to follow the [instructions to install OPA](https://www.openpolicyagent.org/docs/latest/#1-download-opa).

```sh
git clone git@github.com:kevinswiber/spego.git
opa eval \
  --bundle ./spego/src \
  --format pretty \
  --input ./spego/example/inputs/openapi.json \
  "data.openapi.main.results"
```

Spego can also be used with Conftest. First, be sure to follow the [instructions to download Conftest](https://www.conftest.dev/install/).

```sh
conftest pull git::https://github.com/kevinswiber/spego//src
conftest test -n "openapi.main" ./openapi.json
```

Note: Policy execution can be configured by adding a data file named `data.openapi.ruleset` as defined in the [Configuration](#configuration) section.

## Configuration

- Supports a subset of Spectral custom rulesets, including [Changing Rule Severity](https://meta.stoplight.io/docs/spectral/e5b9616d6d50c-custom-rulesets#changing-rule-severity), [Recommended or All](https://meta.stoplight.io/docs/spectral/e5b9616d6d50c-custom-rulesets#recommended-or-all), [Disabling Rules](https://meta.stoplight.io/docs/spectral/e5b9616d6d50c-custom-rulesets#disabling-rules), and [Enabling Rules](https://meta.stoplight.io/docs/spectral/e5b9616d6d50c-custom-rulesets#enabling-rules).
- Included as data in Open Policy Agent, under `data.openapi.ruleset`.
- Configuration is optional. The recommended policies are executed by default.

### Example configuration

```yaml
openapi:
  ruleset:
    extends: [['spego:oas', 'recommended']]
    rules:
      operation-success-response: error
      openapi-tags: true
```

## Policies (Rules)

### contact-properties

Contact object must have "name", "url" and "email".

### duplicated-entry-in-enum

Recommended: true

Enum values must not have duplicate entry.

### info-contact

Recommended: true

Info object must have "contact" object.

### info-description

Recommended: true

Info "description" must be present and non-empty string.

### info-license

Info object must have "license" object.

### license-url

License object must include "url".

### no-eval-in-markdown

Recommended: true

Markdown descriptions must not have "eval(".

### no-script-tags-in-markdown

Recommended: true

Markdown descriptions must not have "<script>" tags.

### openapi-tags-uniqueness

Recommended: true

Each tag must have a unique name.

### openapi-tags

OpenAPI object must have non-empty "tags" array.

### operation-description

Recommended: true

Operation "description" must be present and non-empty string.

### operation-operationId-unique

Recommended: true

Every operation must have unique "operationId".

### operation-operationId-valid-in-url

Recommended: true

operationId must not have characters that are invalid when used in URL.

### operation-operationId

Recommended: true

Operation must have "operationId".

### operation-parameters

Recommended: true

Operation parameters are unique and non-repeating.

### operation-singular-tag

Operation must not have more than a singular tag.

### operation-success-response

Recommended: true

Operation must have at least one "2xx" or "3xx" response.

### operation-tag-defined

Recommended: true

Operation tags must be defined in global tags.

### operation-tags

Recommended: true

Operation must have non-empty "tags" array.

### path-declarations-must-exist

Recommended: true

Path parameter declarations must not be empty, ex."/given/{}" is invalid.

### path-keys-no-trailing-slash

Recommended: true

Path must not end with slash.

### path-not-include-query

Recommended: true

Path must not include query string.

### path-params

Recommended: true

Path parameters must be defined and valid.

### tag-description

Tag object must have "description".
