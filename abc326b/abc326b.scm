(use srfi-42)       ;; eager comprehensions

(define (solve n)
  (let1 l (list-ec (: c 1 10) (: x 0 10) (if (< (* c x) 10)) (+ (* c 100) (* x 10) (* c x)))
        (find (^x (>= x n)) l)))

(define (main args)
  (let1 n (read)
        (print (solve n)))
  0)
