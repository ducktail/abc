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

(define (solve s t)
  (let1 los (string-length s)
        (let loop ([w 1]
                   [i 0])
          (cond [(= w los) 'No]
                [(= i w) (loop (+ w 1) 0)]
                [else (let* ([l (quotient (+ (- los i) (- w 1)) w)]
                             [ns (list->string (map (^j (string-ref s (+ i (* w j)))) (iota l)))])
                        (if (string=? ns t) 'Yes (loop w (+ i 1))))]))))

(define (main args)
  (let* ([s (readm str)]
         [t (readm str)])
    (print (solve s t)))
  0)
