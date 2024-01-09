(define (main args)
  (let* ([s (read-line)]
         [l (string-length s)])
    (string-set! s (- l 1) #\4)
    (print s))
  0)
