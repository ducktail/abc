(define (main args)
  (let* ([k (read)]
         [gg (read)]
         [mm (read)])
    (let loop ([k k]
               [g 0]
               [m 0])
      (cond [(zero? k) (format #t "~a ~a~%" g m)]
            [(= g gg) (loop (- k 1) 0 m)]
            [(zero? m) (loop (- k 1) g mm)]
            [else (let1 mn (min (- gg g) m)
                        (loop (- k 1) (+ g mn) (- m mn)))])))
  0)
