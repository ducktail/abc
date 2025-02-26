(use srfi-13)       ;; string library

(define (main args)
  (let1 d (read-line)
        (print (string-map (^x (cond [(char=? x #\N) #\S]
                                     [(char=? x #\S) #\N]
                                     [(char=? x #\E) #\W]
                                     [(char=? x #\W) #\E]
                                     [else #\space])) d)))
  0)
