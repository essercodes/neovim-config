;; extends

; Inherited by javascript, typescript, tsx; see the sql? predicate in lazy/treesitter.lua

; `SELECT ... FROM ...`
((template_string) @injection.content
  (#sql? @injection.content)
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
  (#set! injection.language "sql"))

; 'SELECT ... FROM ...' / "SELECT ... FROM ..."
((string
  (string_fragment) @injection.content)
  (#sql? @injection.content)
  (#set! injection.language "sql"))

; Explicit opt-in: a template string starting with a `-- sql` comment
; (not plain strings: escape sequences split them into separate fragments)
((template_string) @injection.content
  (#lua-match? @injection.content "^`%s*%-%-%s*sql")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
  (#set! injection.language "sql"))
