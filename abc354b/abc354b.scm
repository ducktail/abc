(use scheme.list)
(use scheme.vector)
(use scheme.sort)

(define (solve n vsc)
  (let1 t (vector-fold (^(a x) (+ a (cadr x))) 0 vsc)
        (car (vector-ref vsc (remainder t n)))))

(define (main args)
  (let* ([n (read)]
         [vsc (vector-sort (^(a b) (string<? (car a) (car b)))
                           (vector-tabulate n (^_ (let* ([s (symbol->string (read))][c (read)])(list s c)))))])
    (print (solve n vsc)))
  0)
