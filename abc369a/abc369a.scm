(define (main args)
  (let* ([a (read)]
         [b (read)])
    (print (cond [(= a b) 1]
                 [(even? (+ a b)) 3]
                 [else 2])))
  0)
