(define (solve r g b c)
  (cond [(eq? c 'Red) (min g b)]
        [(eq? c 'Green) (min r b)]
        [else (min r g)]))

(define (main args)
  (let* ([r (read)]
         [g (read)]
         [b (read)]
         [c (read)])
    (print (solve r g b c)))
  0)
