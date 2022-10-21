$PWD = $(pwd)

test:
	conftest test --update file://$(PWD)/../src --data ./data.yaml --namespace "openapi.main" ../example/openapi.json

.PHONY: pull test
