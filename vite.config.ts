import { defineConfig } from "vite";
import tailwindcss from "@tailwindcss/vite";

export default defineConfig({
  build: {
    sourcemap: false
  },
  plugins: [tailwindcss()],
  resolve: {
    alias: {
      "@": "/src",
      "@components": "/.vitepress/theme/components",
      "@utils": "/.vitepress/theme/utils",
      "@demos": "/.vitepress/theme/components/demos",
      "@logs": "/.vitepress/theme/logs"
    }
  }
});
