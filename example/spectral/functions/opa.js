exports.opa = function opa(input, { code, policy }) {
  policy.setData({
    openapi: {
      ruleset: {
        extends: [['spego:oas', 'off']],
        rules: { [code]: true },
      },
    },
  });

  try {
    const result = policy.evaluate(input, 'openapi/main/problems');
    return result[0].result;
  } catch (err) {
    console.error('Error executing OPA policy:', err);
  }
};
