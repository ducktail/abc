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

(define (solve la lst)
  (fold-left (^(x a st) ($ + a $ * (cadr st) $ quotient x (car st)))
             (car la) (cdr la) lst))

(define (main args)
  (let* ([n (read)]
         [la (readm list n sym)]
         [lst (readm list (- n 1) list 2 sym)])
    (print (solve la lst)))
  0)
