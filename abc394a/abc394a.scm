(define (main args)
  (let1 s (read-line)
        (print ($ list->string
                  $ filter (^c (char=? c #\2))
                  $ string->list s)))
  0)
