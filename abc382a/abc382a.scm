(define (main args)
  (let* ([n (read)]
         [d (read)]
         [s (symbol->string (read))])
    (print (- (+ n d) (length (filter (^x (char=? x #\@)) (string->list s))))))
  0)
