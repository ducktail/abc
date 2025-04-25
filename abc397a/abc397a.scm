(define (main args)
  (let1 x (read)
        (print (cond [(>= x 38.0) 1]
                     [(>= x 37.5) 2]
                     [else 3])))
  0)
