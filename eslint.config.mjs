import globals from "globals";
import pluginJs from "@eslint/js";

/** @type {import('eslint').Linter.Config[]} */
export default [
  { languageOptions: { globals: globals.browser } },
  { ignores: ["app/assets/builds", "bun.config.js", "tailwind.config.js"] },
  pluginJs.configs.recommended,
];
