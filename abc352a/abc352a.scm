(define (main args)
  (let* ([n (read)]
         [x (read)]
         [y (read)]
         [z (read)])
    (print (if (or (< x z y) (> x z y)) 'Yes 'No)))
  0)
