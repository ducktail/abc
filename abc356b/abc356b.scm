(use scheme.vector)

(define (solve va vx)
  (if (vector-fold (^(b a x) (and b (<= a x))) #t va vx) 'Yes 'No))

(define (main args)
  (let* ([n (read)]
         [m (read)]
         [va (vector-tabulate m (^_ (read)))]
         [vx (make-vector m 0)])
    (do [(i 0 (+ i 1))]
        [(= i n)]
      (let1 v (vector-tabulate m (^_ (read)))
            (do [(j 0 (+ j 1))]
                [(= j m)]
              (vector-set! vx j (+ (vector-ref v j) (vector-ref vx j))))))
    (print (solve va vx)))
  0)
