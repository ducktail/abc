(define (main args)
  (let1 q (read)
        (let1 v (make-vector 1000001 0)
              (let loop ([q q]
                         [ct 0])
                (cond [(zero? q) '()]
                      [else (let1 cmd (read)
                                  (cond [(= cmd 1) (let1 x (read)
                                                         (let1 y (vector-ref v x)
                                                               (cond [(zero? y) (vector-set! v x 1)
                                                                      (loop (- q 1) (+ ct 1))]
                                                                     [else (vector-set! v x (+ y 1))
                                                                           (loop (- q 1) ct)])))]
                                        [(= cmd 2) (let1 x (read)
                                                         (let1 y (vector-ref v x)
                                                               (cond [(= 1 y) (vector-set! v x 0)
                                                                      (loop (- q 1) (- ct 1))]
                                                                     [else (vector-set! v x (- y 1))
                                                                           (loop (- q 1) ct)])))]
                                        [else (print ct) (loop (- q 1) ct)]))]))))
  0)
