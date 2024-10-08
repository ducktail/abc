(define (main args)
  (let* ([s (read-line)]
         [l (string-length s)])
    (print (if (string=? "san" (substring s (- l 3) l)) 'Yes 'No)))
  0)
