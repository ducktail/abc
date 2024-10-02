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

(define (solve ls)
  (let loop ([i 1]
             [l ls]
             [ct 0])
    (cond [(null? l) ct]
          [(= i (string-length (car l))) (loop (+ i 1) (cdr l) (+ ct 1))]
          [else (loop (+ i 1) (cdr l) ct)])))

(define (main args)
  (let1 ls (readm list 12 str)
        (print (solve ls)))
  0)
