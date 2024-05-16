(use scheme.list)
(use util.match)

(define-syntax readm
  (syntax-rules (sym str list vec)
    [(_ list n t ...)
     (unfold (pa$ = n) (^_ (readm t ...)) (pa$ + 1) 0)]
    [(_ vec n t ...)
     (vector-tabulate n (^_ (readm t ...)))]
    [(_ sym)
     (read)]
    [(_ str)
     (symbol->string (read))]))

(define (solve k la)
  (+ 1
     (car
      (fold-left (^(cs a)
                   (match cs
                     [(ct . sp)
                      (cond [(>= sp a) (cons ct (- sp a))]
                            [else (cons (+ ct 1) (- k a))])])
                   ) (cons 0 k) la))))

(define (main args)
  (let* ([n (read)]
         [k (read)]
         [la (readm list n sym)])
    (print (solve k la)))
  0)
