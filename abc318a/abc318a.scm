(define (main args)
  (let* ([n (read)]
         [m (read)]
         [p (read)])
    (print
     (cond [(< n m) 0]
           [else (+ 1 (quotient (- n m) p))])))
  0)
