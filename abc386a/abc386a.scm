(use scheme.set)

(define (solve a b c d)
  (if (= 2 (set-size (set eq-comparator a b c d))) 'Yes 'No))

(define (main args)
  (let* ([a (read)]
         [b (read)]
         [c (read)]
         [d (read)])
    (print (solve a b c d)))
  0)
