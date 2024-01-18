(define (main args)
  (let1 n (read)
        (print (let loop ([c 0]
                          [x n])
                 (cond [(odd? x) c]
                       [else (loop (+ c 1) (quotient x 2))]))))
  0)
