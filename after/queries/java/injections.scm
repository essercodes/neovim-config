;; extends

; See the sql? predicate in lazy/treesitter.lua. Escape sequences split string
; content, so the first fragment is tested and the whole string is injected.

; "SELECT ... FROM ..."
((string_literal
  .
  (string_fragment) @_sql) @injection.content
  (#sql? @_sql)
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
  (#set! injection.language "sql"))

; """SELECT ... FROM ..."""
((string_literal
  .
  (multiline_string_fragment) @_sql) @injection.content
  (#sql? @_sql)
  (#offset! @injection.content 0 3 0 -3)
  (#set! injection.include-children)
  (#set! injection.language "sql"))

; Explicit opt-in: a text block starting with a `-- sql` comment
; (not plain strings: they can't span lines)
((string_literal
  .
  (multiline_string_fragment) @_sql) @injection.content
  (#lua-match? @_sql "^%s*%-%-%s*sql")
  (#offset! @injection.content 0 3 0 -3)
  (#set! injection.include-children)
  (#set! injection.language "sql"))
