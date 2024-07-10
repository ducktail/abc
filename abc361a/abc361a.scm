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

(define (main args)
  (let* ([n (read)]
         [k (read)]
         [x (read)]
         [ly (readm list k sym)]
         [lx (readm list (- n k) sym)])
    (print (string-join (map number->string (append ly (cons x lx))) " ")))
  0)
