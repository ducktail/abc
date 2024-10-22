[(define (solve n s)
  (let loop ([i 0]
             [c 0])
    (cond [(> i (- n 3)) c]
          [(string=? "#.#" (substring s i (+ i 3))) (loop (+ i 1) (+ c 1))]
          [else (loop (+ i 1) c)])))

(define (main args)
  (let* ([n (string->number (read-line))]
         [s (read-line)])
    (print (solve n s)))
  0)
]
