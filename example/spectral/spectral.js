const fs = require('node:fs');
const { loadPolicySync } = require('@open-policy-agent/opa-wasm');
const { opa } = require('./functions/opa.js');
const policies = require('./policies');
const wasm = require('./wasm');

const policyModule = Buffer.from(wasm, 'base64');
const policy = loadPolicySync(policyModule);

const policyAnnotations = policies?.annotations
  .filter(
    (policy) => policy.location.file.includes('policies') && policy.annotations
  )
  .map((policy) => policy.annotations);

const rules = {};

for (const { title, description, custom } of policyAnnotations) {
  rules[title] = {
    description,
    severity: custom?.severity,
    recommended: custom?.recommended,
    given: '$',
    then: {
      function: opa,
      functionOptions: {
        code: title,
        policy,
      },
    },
  };
}

module.exports = {
  rules,
};
