import starlight from "@astrojs/starlight"
import catppuccin from "@catppuccin/starlight"
// @ts-check
import { defineConfig } from "astro/config"
import { remarkHeadingId } from "remark-custom-heading-id"
import starlightAutoSidebar from "starlight-auto-sidebar"

// https://astro.build/config
export default defineConfig({
	markdown: {
		remarkPlugins: [remarkHeadingId],

	},
	integrations: [
		starlight({
			title: "flake-parts",
			social: [{ icon: "github", label: "GitHub", href: "https://github.com/hercules-ci/flake-parts" }],
			sidebar: [
				{ slug: '' },
				{ slug: 'getting-started' },
				{
					label: "Tutorials",
					items: [
						{ slug: "best-practices-for-module-writing" },
						{ slug: "system" },
					],
				},
				{
					label: "Guides",
					items: [
						{ slug: "debug" },
						{ slug: "define-module-in-separate-file" },
						{ slug: "define-custom-flake-attribute" },
						{ slug: "generate-documentation" },
						{ slug: "dogfood-a-reusable-module" },
					],
				},
				{
					label: "Explanation",
					items: [
						{ slug: "overlays" },
					],
				},
				{
					label: "Reference",
					autogenerate: { directory: "reference" },
				},
			],
			plugins: [catppuccin(), starlightAutoSidebar()],
		}),
	],
	vite: {
		server: {
			watch: {
				ignored: ["**/.direnv/**"],
			},
		},
	},
})
