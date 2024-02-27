(define-syntax s~
  (syntax-rules ()
    [(_ s i)
     (string-ref s i)]))

(define (solve s)
  (cond [(char=? (s~ s 0) (s~ s 1)) (let loop ([i 2]) (if (char=? (s~ s 0) (s~ s i)) (loop (+ i 1)) (+ i 1)))]
        [(char=? (s~ s 0) (s~ s 2)) 2]
        [else 1]))

(define (main args)
  (let1 s (read-line)
        (print (solve s)))
  0)
