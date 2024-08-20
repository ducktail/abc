(define (main args)
  (let* ([a (read)]
         [b (read)]
         [c (read)])
    (print
     (cond [(< a b c) 'Yes]
           [(< b c a) 'Yes]
           [(< c a b) 'Yes]
           [else 'No])))
  0)
