(define (solve s)
  (let1 l (string-length s)
        (let loop ([i 0]
                   [c 0])
          (cond [(> i (- l 2)) (- l c)]
                [(and (char=? #\0 (string-ref s i))
                      (char=? #\0 (string-ref s (+ i 1)))) (loop (+ i 2) (+ c 1))]
                [else (loop (+ i 1) c)]))))

(define (main args)
  (let1 s (read-line)
        (print (solve s)))
  0)
