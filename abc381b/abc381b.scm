(use util.match)
(use scheme.set)

(define (solve s)
  (let loop ([st (set char-comparator)]
             [l (string->list s)])
    (match l
      [(x y . ys)
       (cond [(set-contains? st x) 'No]
             [(char=? x y) (loop (set-adjoin st x) ys)]
             [else 'No])]
      [() 'Yes]
      [_ 'No])))

(define (main args)
  (let1 s (read-line)
        (print (solve s)))
  0)
