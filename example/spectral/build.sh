#!/usr/bin/env bash

opa build \
  --target wasm \
  --bundle ../../src \
  --entrypoint "openapi/main/results" \
  --entrypoint "openapi/main/problems" \
  --entrypoint "openapi/main/successes"
tar -xzvf bundle.tar.gz /policy.wasm

opa inspect --annotations --format json ../../src >policies.json
