(define (main args)
  (for-each
   print
   (let loop ([l '()])
     (let1 a (read)
           (cond [(zero? a) (cons 0 l)]
                 [else (loop (cons a l))]))))
  0)
