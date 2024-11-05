(use scheme.vector)

(define (solve a b c d)
  (let1 v (make-vector 5 0)
        (vector-set! v a (+ 1 (vector-ref v a)))
        (vector-set! v b (+ 1 (vector-ref v b)))
        (vector-set! v c (+ 1 (vector-ref v c)))
        (vector-set! v d (+ 1 (vector-ref v d)))
        (vector-fold (^(c x) (+ c (quotient x 2))) 0 v)))

(define (main args)
  (let* ([a (read)]
         [b (read)]
         [c (read)]
         [d (read)])
    (print (solve a b c d)))
  0)
