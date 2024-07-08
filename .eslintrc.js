module.exports = {
    extends: ['plugin:@docusaurus/recommended'],
    env: {
      es6: true,
    },
    parserOptions: {
      sourceType: 'module',
      ecmaVersion: 2018,
      ecmaFeatures: {
        jsx: true,
      },
    },
    rules: {
      '@docusaurus/no-untranslated-text': "off",
      "@docusaurus/string-literal-i18n-messages": "warn",
      "@docusaurus/no-html-links":	"error",
      "@docusaurus/prefer-docusaurus-heading": "error",
      "no-console": ["error", { "allow": ["error", "warn"] }]
    },
  };
