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

(define (solve l r a)
  (cond [(< a l) l]
        [(< r a) r]
        [else a]))

(define (main args)
  (let* ([n (read)]
         [l (read)]
         [r (read)]
         [la (readm list n sym)])
    (print (string-join (map (^a (number->string (solve l r a))) la) " ")))
  0)
