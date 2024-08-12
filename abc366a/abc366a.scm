(define (main args)
  (let* ([n (read)]
         [t (read)]
         [a (read)])
    (print (cond [(< n (* 2 t)) 'Yes]
                 [(< n (* 2 a)) 'Yes]
                 [else 'No])))
  0)
