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

(define (zorome i d)
  (cond [(and (< i 10) (< d i)) 0]
        [(and (< i 10) (< d (* i 11)))1]
        [(< i 10) 2]
        [(> (remainder i 11) 0) 0]
        [else (let1 j (quotient i 11)
                    (cond [(< d j) 0]
                          [(< d i) 1]
                          [else 2]))]))

(define (solve n vd)
  (fold-left (^(c i) (+ c (zorome i (vector-ref vd (- i 1))))) 0 (iota n 1)))

(define (main args)
  (let* ([n (read)]
         [vd (readm vec n sym)])
    ($ print $ solve n vd))
  0)
