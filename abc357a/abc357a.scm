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

(define (solve m l)
  (let loop ([ct 0]
             [sm 0]
             [l l])
    (cond [(null? l) ct]
          [(< m (+ (car l) sm)) ct]
          [else (loop (+ ct 1) (+ (car l) sm) (cdr l))])))

(define (main args)
  (let* ([n (read)]
         [m (read)]
         [lh (readm list n sym)])
    (print (solve m lh)))
  0)
