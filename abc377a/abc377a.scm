(define (solve s)
  (if (string=? "ABC"
                (list->string
                 (sort (string->list s)))) 'Yes 'No))

(define (main args)
  (let1 s (read-line)
        (print (solve s)))
  0)
