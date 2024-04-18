(use gauche.sequence)

(define (solve s)
  (if ($ every (pa$ = 2)
         $ map length
         $ group-sequence
         $ sort
         $ map length
         $ group-sequence
         $ sort
         $ string->list s) "Yes" "No"))

(define (main args)
  (let1 s (read-line)
        (print (solve s)))
  0)
