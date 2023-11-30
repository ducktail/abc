(define (divn n x)
  (if (zero? (remainder x n)) (divn n (quotient x n)) x))

(define (main args)
  (let1 n (read)
        (print (if (= 1 ($ divn 2 $ divn 3 n)) 'Yes 'No)))
  0)
