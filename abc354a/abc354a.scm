(use gauche.collection)

(define (main args)
  (let1 n (read)
        (print
         (find (^i (> (expt 2 i) (+ n 1))) (iota 30 1))))
  0)
