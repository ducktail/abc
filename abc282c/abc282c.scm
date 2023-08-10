(define (solve lc)
  (list->string
   (let loop ([o #t]
              [lc lc])
     (cond [(null? lc) '()]
           [(char=? #\" (car lc)) (cons #\" (loop (not o) (cdr lc)))]
           [(and o (char=? #\, (car lc))) (cons #\. (loop o (cdr lc)))]
           [else (cons (car lc) (loop o (cdr lc)))]))))

(define (main args)
  (let* ([_ (read-line)]
         [lc (string->list (read-line))])
    (print (solve lc)))
  0)
