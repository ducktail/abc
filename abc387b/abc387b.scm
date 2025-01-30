(use srfi-42)       ;; eager comprehensions

(define (solve n)
  (let1 v (make-vector 82 0)
        (do-ec
         (: i 1 10)
         (: j 1 10)
         (vector-set! v (* i j) (+ (* i j) (vector-ref v (* i j)))))
        (- 2025 (vector-ref v n))))

(define (main args)
  (let1 n (read)
        (print (solve n)))
  0)
