(use scheme.list)

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

(define (bsearch xok xng f)
  (cond [(= (+ xok 1) xng) xok]
        [else (let1 x (quotient (+ xok xng) 2)
                    (cond [(f x) (bsearch x xng f)]
                          [else (bsearch xok x f)]))]))

(define (solve m la)
  (cond [(<= (apply + la) m) 'infinite]
        [else (bsearch 0 (expt 10 10) (^x (<= (apply + (map (^y (min x y)) la)) m)))]))

(define (main args)
  (let* ([n (read)]
         [m (read)]
         [la (readm list n sym)])
    (print (solve m la)))
  0)
