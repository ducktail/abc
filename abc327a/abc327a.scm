(define (main args)
  (let* ([n (read)]
         [s ($ symbol->string $ read)])
    (print
     (let loop ([i 1])
       (cond [(= i n) 'No]
             [else (let1 ss (substring s (- i 1) (+ i 1))
                         (cond [(string=? ss "ab") 'Yes]
                               [(string=? ss "ba") 'Yes]
                               [else (loop (+ i 1))]))]))))
  0)
