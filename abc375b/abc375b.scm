(define (solve n vxy)
  (let loop ([i 0]
             [l 0.0])
    (cond [(> i n) l]
          [else (let ([x0 (car (vector-ref vxy i))]
                      [y0 (cdr (vector-ref vxy i))]
                      [x1 (car (vector-ref vxy (+ i 1)))]
                      [y1 (cdr (vector-ref vxy (+ i 1)))])
                  (loop (+ i 1) (+ l
                                   (sqrt (+ (expt (- x1 x0) 2) (expt (- y1 y0) 2))))))])))

(define (main args)
  (let* ([n (read)]
         [vxy (vector-tabulate (+ n 2) (^i (cond [(zero? i) (cons 0 0)]
                                                 [(= i (+ n 1)) (cons 0 0)]
                                                 [else (let* ([x (read)]
                                                              [y (read)])
                                                         (cons x y))])))])
    (print (solve n vxy)))
  0)
