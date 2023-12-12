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

(define (solve s k l)
  (let1 sm (apply + (map (^(pq) (apply * pq)) l))
        (cond [(>= sm s) sm]
              [else (+ sm k)])))

(define (main args)
  (let* ([n (read)]
         [s (read)]
         [k (read)]
         [lpq (readm list n list 2 sym)])
    (print (solve s k lpq)))
  0)
