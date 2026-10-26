;; extends

; See the sql? predicate in lazy/treesitter.lua

; "SELECT ... FROM ..." (escape sequences split the content, so the first
; fragment is tested and the whole string is injected)
((string_literal
  .
  (string_content) @_sql) @injection.content
  (#sql? @_sql)
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
  (#set! injection.language "sql"))

; r#"SELECT ... FROM ..."#
((raw_string_literal
  (string_content) @injection.content)
  (#sql? @injection.content)
  (#set! injection.language "sql"))

; Explicit opt-in: a string starting with a `-- sql` comment
((string_literal
  .
  (string_content) @_sql) @injection.content
  (#lua-match? @_sql "^%s*%-%-%s*sql")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
  (#set! injection.language "sql"))
((raw_string_literal
  (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*%-%-%s*sql")
  (#set! injection.language "sql"))
