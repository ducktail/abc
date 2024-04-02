(use scheme.list)

(define-syntax readm
  (syntax-rules (sym str list vec)
    [(_ list n t ...)
     (unfold (pa$ = n) (^_ (readm t ...)) (pa$ + 1) 0)]
    [(_ vec n t ...)
     (vector-tabulate n (^_ (readm t ...)))]
    [(_ sym)
     (read)]
    [(_ str)
     (symbol->string (read))]))

(define (number-list->string l)
  (string-join (map number->string l) " "))

(define (main args)
  (let* ([n (read)]
         [k (read)]
         [la (readm list n sym)])
    ($ print
       $ number-list->string
       $ map (cut quotient <> k)
       $ filter (^x (zero? (remainder x k))) la))
  0)
