(define (main args)
  (let* ([a (read)]
         [b (read)])
    (print (cond [(= a b) -1]
                 [else (- 6 a b)])))
  0)
