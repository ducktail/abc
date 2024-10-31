(use scheme.vector)

(define (solve vs)
  (let ([vhr (make-vector 8 1)]
        [vvr (make-vector 8 1)])
    (do [(i 0 (+ i 1))]
        [(= i 8) (* (vector-fold + 0 vhr) (vector-fold + 0 vvr))]
      (do [(j 0 (+ j 1))]
          [(= j 8)]
        (cond [(char=? #\# (~ vs i j)) (vector-set! vvr i 0) (vector-set! vhr j 0)])))))

(define (main args)
  (let1 vs (vector-tabulate 8 (^_ (read-line)))
        (print (solve vs)))
  0)
