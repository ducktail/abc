(define (solve s)
  (let loop ([i 1])
    (cond [(> i 15) 'Yes]
          [(char=? #\0 (string-ref s i)) (loop (+ i 2))]
          [else 'No])))

(define (main args)
  (let1 s (read-line)
        (print (solve s)))
  0)
