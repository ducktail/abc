(use scheme.list)

(define-syntax v~
  (syntax-rules ()
    [(_ v i)
     (vector-ref v i)]
    [(_ v i j ...)
     (v~ (vector-ref v i) j ...)]))

(define (solve n v)
  (fold-left (^(i j) (if (>= i j) (v~ v (- i 1) (- j 1)) (v~ v (- j 1) (- i 1)))) 1 (iota n 1)))

(define (main args)
  (let* ([n (read)]
         [va (vector-tabulate n (^i (vector-tabulate (+ i 1) (^_ (read)))))])
    (print (solve n va)))
  0)
