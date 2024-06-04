(define (solve n l r)
  (receive (la lb) (split-at (iota n 1) (- l 1))
    (receive (lbn lc) (split-at lb (- r l -1))
      (append la (reverse lbn) lc))))

(define (main args)
  (let* ([n (read)]
         [l (read)]
         [r (read)])
    (print (string-join (map number->string (solve n l r)) " ")))
  0)
