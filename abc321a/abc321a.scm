(define (solve l s)
  (let loop ([i 1])
    (cond [(= i l) 'Yes]
          [(> (char->integer (string-ref s (- i 1))) (char->integer (string-ref s i))) (loop (+ i 1))]
          [else 'No])))

(define (main args)
  (let1 n (read-line)
        (print (solve (string-length n) n)))
  0)
