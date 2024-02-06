(define (main args)
  (let1 s (read-line)
    (print (last (string-split s #\.))))
  0)
