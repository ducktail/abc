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

(define (solve la)
  (let1 ht (make-hash-table)
        (for-each (^a (hash-table-update! ht a (pa$ + 1) 0))la)
        (hash-table-fold ht (^(_ v c) (+ c (quotient v 2))) 0)))

(define (main args)
  (let* ([n (read)]
         [la (readm list n sym)])
    (print (solve la)))
  0)
