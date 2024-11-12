(define (solve n)
  (receive (a bc) (quotient&remainder n 100)
    (receive (ab c) (quotient&remainder n 10)
      (format #f "~a ~a"
              (+ (* bc 10) a)
              (+ (* c 100) ab)))))

(define (main args)
  (let1 n (read)
        (print (solve n)))
  0)
