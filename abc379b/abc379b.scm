(define (solve k s)
  (apply + (map (^x (quotient (string-length x) k)) (string-split s #\X))))

(define (main args)
  (let* ([nk (map string->number (string-split (read-line) char-whitespace?))]
         [s (read-line)])
    (print (solve (cadr nk) s)))
  0)
