(use scheme.list)
(use util.match)
(use scheme.sort)

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
             [l (sort la >)])
    (match l
      [(x y . r) (cond [(zero? y) ct]
                       [else (loop (+ ct 1) (sort (cons (- x 1) (cons (- y 1) r)) >))])])))

(define (main args)
  (let* ([n (read)]
         [la (readm list n sym)])
    (print (solve la)))
  0)
