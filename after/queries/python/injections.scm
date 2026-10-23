;; extends

; Strings that start with a SQL keyword (lua patterns: vim regex can't match the
; leading newline of a triple-quoted string, and lua patterns have no alternation)
((string_content) @injection.content
  (#lua-match? @injection.content "^%s*[Ss][Ee][Ll][Ee][Cc][Tt]%s")
  (#set! injection.language "sql"))
((string_content) @injection.content
  (#lua-match? @injection.content "^%s*[Ii][Nn][Ss][Ee][Rr][Tt]%s")
  (#set! injection.language "sql"))
((string_content) @injection.content
  (#lua-match? @injection.content "^%s*[Uu][Pp][Dd][Aa][Tt][Ee]%s")
  (#set! injection.language "sql"))
((string_content) @injection.content
  (#lua-match? @injection.content "^%s*[Dd][Ee][Ll][Ee][Tt][Ee]%s")
  (#set! injection.language "sql"))
((string_content) @injection.content
  (#lua-match? @injection.content "^%s*[Ww][Ii][Tt][Hh]%s")
  (#set! injection.language "sql"))
((string_content) @injection.content
  (#lua-match? @injection.content "^%s*[Cc][Rr][Ee][Aa][Tt][Ee]%s")
  (#set! injection.language "sql"))
((string_content) @injection.content
  (#lua-match? @injection.content "^%s*[Aa][Ll][Tt][Ee][Rr]%s")
  (#set! injection.language "sql"))
((string_content) @injection.content
  (#lua-match? @injection.content "^%s*[Dd][Rr][Oo][Pp]%s")
  (#set! injection.language "sql"))

; Explicit opt-in: a string starting with a `-- sql` comment
((string_content) @injection.content
  (#lua-match? @injection.content "^%s*%-%-%s*sql")
  (#set! injection.language "sql"))
