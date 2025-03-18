(define (solve s n)
  (let loop ([l 1]
             [i 0]
             [ct 0])
    (cond [(<= n (* 2 l)) ct]
          [(<= n (+ i (* 2 l))) (loop (+ l 1) 0 ct)]
          [(and (char=? #\A (string-ref s i))
                (char=? #\B (string-ref s (+ i l)))
                (char=? #\C (string-ref s (+ i (* 2 l))))) (loop l (+ i 1) (+ ct 1))]
          [else (loop l (+ i 1) ct)])))

(define (main args)
  (let1 s (read-line)
        (print (solve s (string-length s))))
  0)
