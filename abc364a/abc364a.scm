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

(define (solve n ls)
  (if (= (let loop ([ct 0]
             [sw 0]
             [l ls])
    (cond [(null? l) ct]
          [(= sw 2) ct]
          [(eq? (car l) 'salty) (loop (+ ct 1) 0 (cdr l))]
          [else (loop (+ ct 1) (+ sw 1) (cdr l))])) n) 'Yes 'No))

(define (main args)
  (let* ([n (read)]
         [ls (readm list n sym)])
    (print (solve n ls)))
  0)
