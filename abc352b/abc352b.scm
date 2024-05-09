(define (solve s t)
  (let loop ([ls (string->list s)]
             [lt (string->list t)]
             [i 1])
    (cond [(null? ls) '()]
          [(char=? (car ls) (car lt)) (cons i (loop (cdr ls) (cdr lt) (+ i 1)))]
          [else (loop ls (cdr lt) (+ i 1))])))

(define (main args)
  (let* ([s (read-line)]
         [t (read-line)])
    (print (string-join (map number->string (solve s t)) " ")))
  0)
