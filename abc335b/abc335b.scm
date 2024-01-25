(define (main args)
  (let1 n (read)
        (do [(x 0 (+ x 1))]
            [(> x n)]
          (do [(y 0 (+ y 1))]
              [(or (> y n) (> (+ x y) n))]
            (do [(z 0 (+ z 1))]
                [(or (> z n) (> (+ x y z) n))]
              (format #t "~a ~a ~a~%" x y z)))))
  0)
