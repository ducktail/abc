(define (main args)
  (let1 q (read)
        (let loop ([q q]
                   [st '()])
          (cond [(zero? q) #f]
                [else (let1 c (read)
                            (cond [(= c 1) (let1 x (read) (loop (- q 1) (cons x st)))]
                                  [(null? st) (print 0) (loop (- q 1) st)]
                                  [else (print (car st)) (loop (- q 1) (cdr st))]))])))
  0)
