(define (main args)
  (let* ([s (read-line)]
         [l (string-length s)]
         [nl (- (* 2 l) 1)]
         [ns (make-string nl #\space)])
    (print
     (do [(i 0 (+ i 1))]
         [(= i l) ns]
       (string-set! ns (* i 2) (string-ref s i)))))
  0)
