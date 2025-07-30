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

(define (solve k la)
  (fold-left (^(r a)
               (let1 x (* r a)
                     (if (>= x (expt 10 k)) 1 x))
               ) 1 la))
  

(define (main args)
  (let* ([n (read)]
         [k (read)]
         [la (readm list n sym)])
    (print (solve k la)))
  0)
