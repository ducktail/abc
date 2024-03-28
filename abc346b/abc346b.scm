(define (solve w b)
  (let1 va '#(0 1 1 2 2 3 4 4 5 5 6 6 7 8 8 9 9 10 11 11 12 12 13)
        (receive (q r) (quotient&remainder (+ w b) 12)
          (let loop ([i 0])
            (cond [(= i 12) 'No]
                  [(= (+ (* q 7) (- (vector-ref va (+ i r)) (vector-ref va i))) w) 'Yes]
                  [else (loop (+ i 1))])))))

(define (main args)
  (let* ([w (read)]
         [b (read)])
    (print (solve w b)))
  0)
