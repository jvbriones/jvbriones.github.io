const docusaurus = require("@docusaurus/eslint-plugin");

module.exports = [
  {
    files: ["**/*.{js,jsx}"],
    languageOptions: {
      ecmaVersion: 2018,
      sourceType: "module",
      parserOptions: {
        ecmaFeatures: {
          jsx: true,
        },
      },
    },
    plugins: {
      "@docusaurus": docusaurus,
    },
    rules: {
      ...docusaurus.configs.recommended.rules,
      "@docusaurus/no-untranslated-text": "off",
      "@docusaurus/string-literal-i18n-messages": "warn",
      "@docusaurus/no-html-links": "error",
      "@docusaurus/prefer-docusaurus-heading": "error",
      "no-console": ["error", { allow: ["error", "warn"] }],
    },
  },
];
