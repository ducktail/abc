(use scheme.list)
(use util.match)

(define (solve s)
  (match (string-split s #\|)
    [(a b c) (string-append a c)]))

(define (main args)
  (let1 s (read-line)
        (print (solve s)))
  0)
