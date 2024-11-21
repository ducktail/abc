(define (solve s)
  (string-join
   (map number->string
        (filter (pa$ < 0) (map string-size (string-split s #\|))))
   " "))

(define (main args)
  (let1 s (read-line)
        (print (solve s)))
  0)
