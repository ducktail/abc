(use util.match)

(define (solve llx)
  (map (^l (apply + (map (^x (* x x)) l))) llx))

(define (main args)
  (let* ([l (read)]
         [r (read)])
    (print (match (+ r (* 2 l))
             [1 'No]
             [2 'Yes]
             [_ 'Invalid])))
  0)
