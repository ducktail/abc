(define (solve s)
  (let1 n (string->number (substring s 3 6))
        (cond [(zero? n) 'No]
              [(= n 316) 'No]
              [(>= n 350) 'No]
              [else 'Yes])))

(define (main args)
  (let1 s (read-line)
        (print (solve s)))
  0)
