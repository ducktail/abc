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

(define (solve s)
  (let loop ([i 0]
             [a #f]
             [b #f]
             [c #f])
    (cond [(and a b c) i]
          [(char=? #\A (string-ref s i)) (loop (+ i 1) #t b c)]
          [(char=? #\B (string-ref s i)) (loop (+ i 1) a #t c)]
          [else (loop (+ i 1) a b #t)])))

(define (main args)
  (let* ([_ (read)]
         [s (readm str)])
    (print (solve s)))
  0)
