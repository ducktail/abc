(define (main args)
  (let* ([a (read)]
         [b (read)])
    (print (+ (expt a b) (expt b a))))
  0)
