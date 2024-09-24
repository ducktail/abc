(define (main args)
  (let1 s (read-line)
        ($ print
           $ list->string
           $ filter (^c (not (char=? c #\.)))
           $ string->list s))
  0)
