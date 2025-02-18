(define (solve n)
  (let loop ([n n]
             [x 2])
    (cond [(= n 1) (- x 1)]
          [else (loop (quotient n x) (+ x 1))])))

(define (main args)
  (let1 n (read)
        (print (solve n)))
  0)
