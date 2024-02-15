(use scheme.list)

(define (main args)
  (let1 q (read)
        (let loop ([i q]
                   [s '()])
          (cond [(zero? i) '()]
                [else (let* ([c (read)]
                             [x (read)])
                        (cond [(= c 1) (loop (- i 1) (cons x s))]
                              [else (print (car (drop s (- x 1)))) (loop (- i 1) s)]))])))
  0)
