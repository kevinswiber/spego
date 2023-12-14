#!/usr/bin/env bash

echo "1. Building OPA bundle..."
opa build \
  --target wasm \
  --bundle ../../src \
  --entrypoint "openapi/main/problems" \
  --output ./build/bundle.tar.gz

echo "2. Extracting policy.wasm from bundle..."
tar -xzf ./build/bundle.tar.gz -C ./build /policy.wasm 2>&1 | grep -v "Removing leading"

echo "3. Converting Wasm file into a base64-decoded string: ./wasm.js"
wasm=$(openssl base64 -A -in ./build/policy.wasm)
echo "exports.policyWasmBuffer = Buffer.from(\`$wasm\`, 'base64');" >./wasm.js

echo "4. Extracting annotations: ./policies.js"
policies=$(opa inspect --annotations --format json ../../src)
echo "module.exports = $policies;" >./policies.js

echo "Done!"
