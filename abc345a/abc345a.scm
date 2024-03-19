(define (main args)
  (let* ([s (read-line)]
         [l (string-length s)]
         [t (string-append "<" (make-string (- l 2) #\=)">")])
    (print (if (string=? s t) 'Yes 'No)))
  0)
