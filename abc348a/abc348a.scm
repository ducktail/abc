(define (main args)
  (let1 n (read)
        (let loop ([i 0])
          (cond [(= i n) (print "")]
                [(= 2 (remainder i 3)) (display "x") (loop (+ i 1))]
                [else (display "o") (loop (+ i 1))])))
  0)
