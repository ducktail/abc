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

(define (solve tv)
  (cdr
   (fold-left (^(a b)
                (match a
                  [(ti . vi)
                   (match b
                     [(tj vj)
                      (cons tj (+ vj (max 0 (- vi (- tj ti)))))])])) (cons 0 0) tv)))

(define (main args)
  (let* ([n (read)]
         [tv (readm list n list 2 sym)])
    (print (solve tv)))
  0)
