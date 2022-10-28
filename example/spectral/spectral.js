const fs = require('node:fs');
const { loadPolicySync } = require('@open-policy-agent/opa-wasm');
const { opa } = require('./functions/opa.js');

const policies = JSON.parse(fs.readFileSync('./policies.json', 'utf-8'));
const policyModule = fs.readFileSync('./policy.wasm');
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
