(use scheme.set)

(define (solve s)
  (let1 len (string-length s)
        (let loop ([l '()]
                   [i 0]
                   [j 1])
          (cond [(= i len) ($ set-size $ list->set string-comparator l)]
                [(> j len) (loop l (+ i 1) (+ i 2))]
                [else (loop (cons (substring s i j) l) i (+ j 1))]))))

(define (main args)
  (let1 s (read-line)
        (print (solve s)))
  0)
