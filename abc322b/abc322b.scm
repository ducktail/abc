(use util.match)

(define (solve n m s t)
  (match (cons (string=? s (substring t 0 n)) (string=? s (substring t (- m n) m)))
         [(#t . #t) 0]
         [(#t . #f) 1]
         [(#f . #t) 2]
         [(#f . #f) 3]))

(define (main args)
  (let* ([n (read)]
         [m (read)]
         [s (symbol->string (read))]
         [t (symbol->string (read))])
    (print (solve n m s t)))
  0)
