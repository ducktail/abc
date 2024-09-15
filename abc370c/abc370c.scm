(define (solve s t)
  (let1 len (string-length s)
        (let loop ([s s]
                   [l '()])
          (cond [(string=? s t) (reverse l)]
                [else (let find ([lc '()]
                                 [i 0])
                        (cond [(= i len)
                               (let1 x (car (sort lc)) (loop x (cons x l)))]
                              [(char=? (string-ref s i)
                                       (string-ref t i)) (find lc (+ i 1))]
                              [else (let1 y (string-copy s)
                                          (string-set! y i (string-ref t i))
                                          (find (cons y lc) (+ i 1)))]))]))))

(define (main args)
  (let* ([s (symbol->string(read))]
         [t (symbol->string(read))])
    (let1 l (solve s t)
          (print (length l))
          (for-each print l)))
  0)
