(define (find vs vt sr sc m)
  (let loop ([r 0]
             [c 0])
    (cond [(= r m) #t]
          [(= c m) (loop (+ r 1) 0)]
          [(char=? (string-ref (vector-ref vt r) c)
                   (string-ref (vector-ref vs (+ sr r)) (+ sc c))) (loop r (+ c 1))]
          [else #f])))

(define (solve n m vs vt)
  (let loop ([sr 0]
             [sc 0])
    (cond [(> sr (- n m)) #f]
          [(> sc (- n m)) (loop (+ sr 1) 0)]
          [(find vs vt sr sc m) (format #f "~a ~a" (+ sr 1) (+ sc 1))]
          [else (loop sr (+ sc 1))])))

(define (main args)
  (let* ([n (read)]
         [m (read)]
         [_ (read-line)]
         [vs (vector-tabulate n (^_ (read-line)))]
         [vt (vector-tabulate m (^_ (read-line)))])
    (print (solve n m vs vt)))
  0)
