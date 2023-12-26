(define (main args)
  (let* ([b (read)]
         [g (read)])
    (print (cond [(> b g) 'Bat]
                 [else 'Glove])))
  0)
