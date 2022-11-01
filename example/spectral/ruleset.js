import { oas2, oas3 } from '@stoplight/spectral-formats';
import opaWasm from '@open-policy-agent/opa-wasm';
import { opa } from './functions/opa.js';
import { annotations } from './policies.js';
import { policyWasmBuffer } from './wasm.js';

const policy = opaWasm.loadPolicySync(policyWasmBuffer);

const policyAnnotations = annotations
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
    formats: [oas2, oas3],
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

export default {
  rules,
};
