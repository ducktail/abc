(define (main args)
  (let1 ls (string->list (read-line))
        (print (if (and (char-upper-case? (car ls))
                        (every char-lower-case? (cdr ls))) 'Yes 'No)))
  0)