(define (solve n s)
  (let1 n2 (quotient n 2)
        (if (and (string=? (substring s 0 n2) (make-string n2 #\1))
                 (string=? (substring s (+ n2 1) n) (make-string n2 #\2))
                 (char=? (string-ref s n2) #\/)) 'Yes 'No)))

(define (main args)
  (let* ([n (string->number(read-line))]
         [s (read-line)])
    (print (solve n s)))
  0)
