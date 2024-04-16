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

(define (solve llx)
  (map (^l (apply + (map (^x (* x x)) l))) llx))

(define (main args)
  (let* ([n (read)]
         [la (readm list (- n 1) sym)])
    (print (- 0 (apply + la))))
  0)
