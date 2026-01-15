def main [] {
	print "Creating reference docs..."
	rm src/content/docs/reference/options/*.md
	rm src/content/docs/reference/options/flake-parts-optional/*.md
	let flake_parts_website_generated_docs_path = (mktemp -d flake_parts_website_generated_docs.XXX)
	rm $flake_parts_website_generated_docs_path
	nix build --inputs-from . "flake-parts-website#generated-docs" --out-link $flake_parts_website_generated_docs_path
	ls $flake_parts_website_generated_docs_path | each {|file|
		if ($file.name | path basename) == "menu.md" {
			return
		}

		# TODO: use mut less
		mut target_file = ""
		if ($file.name | path basename | str starts-with "flake-parts-") {
			$target_file = $"src/content/docs/reference/options/flake-parts-optional/($file.name | path basename | str replace ".html" ".md").tmp"
		} else {
			$target_file = $"src/content/docs/reference/options/($file.name | path basename | str replace ".html" ".md").tmp"
		}
		cp $file.name $target_file
		chmod 664 $target_file

		let content = (open $target_file --raw) | lines

		let heading = ($content | first | str replace "#" "" | str trim)
		mut frontmatter = {
			title: $heading
		}
		if ($heading == "Core Options") {
			$frontmatter = ($frontmatter | update title "flake-parts built in" | insert sidebar { order: (-2) })
		}
		$content | drop nth 0 | prepend ["---" ($frontmatter | to yaml) "---" ""] | to text | save ($target_file | str replace ".tmp" "")
		rm $target_file
	}
	rm -rf $flake_parts_website_generated_docs_path

	print "Creating flake-parts readme..."
	rm src/content/docs/index.md
	let flake_parts_readme_path = (mktemp flake_parts_readme.XXX)
	rm $flake_parts_readme_path
	nix build .#flake-parts-readme --out-link $flake_parts_readme_path
	let flake_parts_readme = (open $flake_parts_readme_path --raw) | lines
	$flake_parts_readme
	| drop nth 1
	| take until {|x| $x == "<!-- end_of_intro -->"}
	| prepend ["---" "title: Flake Parts" "---" ""]
	| to text
	| str replace -a "#" "##"
	| save src/content/docs/index.md
	rm -rf $flake_parts_readme_path

	print "Creating flake-parts website docs..."
	let flake_parts_website_src_path = (mktemp -d flake_parts_website_src.XXX)
	rm $flake_parts_website_src_path
	nix build .#flake-parts-website-src --out-link $flake_parts_website_src_path
	ls $flake_parts_website_src_path | each {|file|
		let file_name = ($file.name | path basename)
		if $file_name == "SUMMARY.md" or $file_name == "highlight.js" {
			return
		}

		let target_file = $"src/content/docs/($file_name).tmp"
		cp $file.name $target_file
		chmod 664 $target_file

		let content = (open $target_file --raw) | lines

		let heading = ($content | first | str replace "#" "" | str trim)
		mut frontmatter = {
			title: $heading
		}
		$content | drop nth 0 | prepend ["---" ($frontmatter | to yaml) "---" ""] | to text | save ($target_file | str replace ".tmp" "")
		rm $target_file
	}
	rm -rf $flake_parts_readme_path
}
