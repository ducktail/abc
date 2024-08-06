(define (solve y)
  (cond [(zero? (remainder y 400)) 366]
        [(zero? (remainder y 100)) 365]
        [(zero? (remainder y 4)) 366]
        [else 365]))

(define (main args)
  (let1 y (read)
        (print (solve y)))
  0)
