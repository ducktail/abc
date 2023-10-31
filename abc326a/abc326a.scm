(define (main args)
  (let* ([x (read)]
         [y (read)])
    (print (if (<= -3 (- y x) 2) 'Yes 'No)))
  0)
