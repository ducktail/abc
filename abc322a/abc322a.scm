(define (solve n s)
  (let loop ([i 1])
    (cond [(> i (- n 2)) -1]
          [(string=? "ABC" (substring s (- i 1) (+ i 2))) i]
          [else (loop (+ i 1))])))

(define (main args)
  (let* ([n (read)]
         [s (symbol->string(read))])
    (print (solve n s)))
  0)
