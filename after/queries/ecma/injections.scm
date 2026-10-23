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
