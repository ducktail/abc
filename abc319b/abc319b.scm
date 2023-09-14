(define (solve n)
  (let1 ls (let loop ([i 9]
                      [l '()])
             (cond [(zero? i) l]
                   [(zero? (remainder n i)) (loop (- i 1) (cons (cons i (quotient n i)) l))]
                   [else (loop (- i 1) l)]))
        (let loop ([i n]
                   [l '()])
          (cond [(< i 0) (string-join l "")]
                [else (let1 x (find (^j (zero? (remainder i (cdr j)))) ls)
                            (if x (loop (- i 1) (cons (number->string (car x)) l)) (loop (- i 1) (cons "-" l))))]))))

(define (main args)
  (let1 n (read)
        (print (solve n)))
  0)
