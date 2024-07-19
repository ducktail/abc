(define (solve xa ya xb yb xc yc)
  (define (f x0 y0 x1 y1 x2 y2)
    (+ (* (- x1 x0) (- x2 x0)) (* (- y1 y0) (- y2 y0))))
  (cond [(zero? (f xa ya xb yb xc yc)) 'Yes]
        [(zero? (f xc yc xa ya xb yb)) 'Yes]
        [(zero? (f xb yb xc yc xa ya)) 'Yes]
        [else 'No]))

(define (main args)
  (let* ([xa (read)]
         [ya (read)]
         [xb (read)]
         [yb (read)]
         [xc (read)]
         [yc (read)])
    (print (solve xa ya xb yb xc yc)))
  0)
