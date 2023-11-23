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
  (let loop ([m1 0]
             [m2 0]
             [l la])
    (cond [(null? l) m2]
          [(> (car l) m1) (loop (car l) m1 (cdr l))]
          [(= (car l) m1) (loop m1 m2 (cdr l))]
          [(> (car l) m2) (loop m1 (car l) (cdr l))]
          [else (loop m1 m2 (cdr l))])))

(define (main args)
  (let* ([n (read)]
         [la (readm list n sym)])
    (print (solve la)))
  0)
