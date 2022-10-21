$PWD = $(pwd)

pull:
	conftest pull --policy ./policy/openapi file://$(PWD)/../src
test: pull
	conftest test -d ./data.yaml -n "openapi.main" ../example/openapi.json

.PHONY: pull test
