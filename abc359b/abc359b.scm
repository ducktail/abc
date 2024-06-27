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

(define (solve la)
  (let loop ([ct 0]
             [l la])
    (match l
      [(x _ z . r) (if (= x z) (loop (+ ct 1) (cdr l)) (loop ct (cdr l)))]
      [_ ct])))

(define (main args)
  (let* ([n (read)]
         [la (readm list (* n 2) sym)])
    (print (solve la)))
  0)
