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

(define (solve n la)
  (cdr
   (list-ref
    (sort
     (map cons la (iota n 1))) (- n 2))))

(define (main args)
  (let* ([n (read)]
         [la (readm list n sym)])
    (print (solve n la)))
  0)
