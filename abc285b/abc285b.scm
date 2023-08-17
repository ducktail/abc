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

(define (solve n s)
  (do [(i 1 (+ i 1))]
      [(= i n)]
    (do [(j 0 (+ j 1))]
        [(or (= (+ j i) n)
             (char=? (string-ref s j) (string-ref s (+ j i)))) (print j)])))

(define (main args)
  (let* ([n (read)]
         [s (readm str)])
    (solve n s))
  0)
