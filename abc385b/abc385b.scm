(use util.match)
(use scheme.set)

(define (solve h w x y fld t)
  (define (np rc d)
    (match rc
      [(r . c) (match d
                 [#\U (cons (- r 1) c)]
                 [#\D (cons (+ r 1) c)]
                 [#\L (cons r (- c 1))]
                 [_ (cons r (+ c 1))])]))
  (let loop ([i 0]
             [r (- x 1)]
             [c (- y 1)]
             [st (set equal-comparator)])
    (cond [(= i (string-length t)) (format #f "~a ~a ~a" (+ r 1) (+ c 1) (set-size st))]
          [else (match (np (cons r c) (string-ref t i))
                  [(nr . nc) (cond [(char=? #\. (string-ref (vector-ref fld nr) nc))
                                    (loop (+ i 1) nr nc st)]
                                  [(char=? #\@ (string-ref (vector-ref fld nr) nc))
                                   (loop (+ i 1) nr nc (set-adjoin st (cons nr nc)))]
                                  [else (loop (+ i 1) r c st)])])])))

(define (main args)
  (let* ([h (read)]
         [w (read)]
         [x (read)]
         [y (read)]
         [_ (read-line)]
         [fld (vector-tabulate h (^_ (read-line)))]
         [t (read-line)])
    (print (solve h w x y fld t)))
  0)
