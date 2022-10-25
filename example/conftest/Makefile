$PWD = $(pwd)

test:
	conftest test --update file://$(PWD)/../../src --data ./data.yaml --namespace "openapi.main" ../inputs/openapi.json

.PHONY: pull test
