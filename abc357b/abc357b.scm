(define (solve l)
  (let1 ct ($ length $ filter char-upper-case? l)
        (list->string
         (if (> (* ct 2) (length l))
             (map char-upcase l) (map char-downcase l)))))

(define (main args)
  (let1 l ($ string->list $ read-line)
        (print (solve l)))
  0)
