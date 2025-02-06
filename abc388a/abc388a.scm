(define (main args)
  (let ([s (read-line)]
        [x (list #\U #\P #\C)])
    (print (list->string (cons (string-ref s 0) x))))
  0)
