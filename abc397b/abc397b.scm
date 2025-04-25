(define (solve s)
  (let ([ls (string-length s)]
        [ic (let loop ([c 0]
                       [l (string->list s)])
              (cond [(null? (cdr l)) c]
                    [(char=? (car l) (cadr l)) (loop (+ c 1) (cdr l))]
                    [else (loop c (cdr l))]))])
    (cond [(odd? (+ ls ic)) (+ ic 1)]
          [(char=? #\o (string-ref s 0)) (+ ic 2)]
          [else ic])))

(define (main args)
  (let1 s (read-line)
        (print (solve s)))
  0)
