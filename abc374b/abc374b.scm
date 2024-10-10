(define (solve s t)
  (cond [(string=? s t) 0]
        [else (let1 l (min (string-length s) (string-length t))
                    (let loop ([i 0])
                      (cond [(and (< i l)
                                  (char=? (string-ref s i) (string-ref t i))) (loop (+ i 1))]
                            [else (+ i 1)])))]))

(define (main args)
  (let* ([s (read-line)]
         [t (read-line)])
    (print (solve s t)))
  0)
