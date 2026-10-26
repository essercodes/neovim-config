;; extends

; See the sql? predicate in lazy/treesitter.lua

; 'SELECT ... FROM ...' / """SELECT ... FROM ..."""
((string_content) @injection.content
  (#sql? @injection.content)
  (#set! injection.language "sql"))

; Explicit opt-in: a string starting with a `-- sql` comment
((string_content) @injection.content
  (#lua-match? @injection.content "^%s*%-%-%s*sql")
  (#set! injection.language "sql"))
