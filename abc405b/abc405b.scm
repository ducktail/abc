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

(define (solve n m la)
  (let1 ex (make-vector (+ m 1) 0)
        (let loop ([ct m]
                   [i 0]
                   [l la])
          (cond [(zero? ct) (- n i -1)]
                [(null? l) 0]
                [(zero? (vector-ref ex (car l)))
                 (vector-set! ex (car l) 1)
                 (loop (- ct 1) (+ i 1) (cdr l))]
                [else (loop ct (+ i 1) (cdr l))]))))

(define (main args)
  (let* ([n (read)]
         [m (read)]
         [la (readm list n sym)])
    (print (solve n m la)))
  0)
