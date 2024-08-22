(define (solve x)
  (let1 l (string-length x)
        (cond [(string=? (substring x (- l 3) l) "000") (substring x 0 (- l 4))]
              [(string=? (substring x (- l 2) l) "00") (substring x 0 (- l 2))]
              [(string=? (substring x (- l 1) l) "0") (substring x 0 (- l 1))]
              [else x])))

(define (main args)
  (let1 x (read-line)
        (print (solve x)))
  0)
