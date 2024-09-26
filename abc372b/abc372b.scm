(define (solve m)
  (let loop ([x m]
             [i 0])
    (cond [(zero? x) '()]
          [else (receive (q r) (quotient&remainder x 3)
                  (cond [(zero? r) (loop q (+ i 1))]
                        [(= r 1) (cons i (loop q (+ i 1)))]
                        [else (cons i (cons i (loop q (+ i 1))))]))])))

(define (main args)
  (let1 m (read)
    (let1 la (solve m)
          (print (length la))
          (print (string-join (map number->string la) " "))))
  0)
