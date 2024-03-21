(define (main args)
  (let1 x (read)
    (print (quotient (if (negative? x) x (+ x 9)) 10)))
  0)
