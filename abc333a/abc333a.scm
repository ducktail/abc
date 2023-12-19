(use scheme.list)
(use srfi-13)       ;; string library
(define (main args)
  (let1 n (read)
        ($ print $ string-concatenate $ list-tabulate n (^_ (number->string n))))
  0)
