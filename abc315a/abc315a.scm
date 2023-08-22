(define (main args)
  (let1 s (read-line)
        ($ print
           $ list->string
           $ filter (^c (not (member c '(#\a #\e #\i #\o #\u))))
           $ string->list s))
  0)
