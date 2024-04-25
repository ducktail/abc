(use scheme.list)
(use gauche.collection)

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

(define (solve n la)
  (- n ($ length $ filter odd? $ map length $ group-collection la)))

(define (main args)
  (let* ([n (read)]
         [q (read)]
         [la (readm list q sym)])
    (print (solve n la)))
  0)
