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

(define (solve l)
  (let loop ([l l]
             [tk 0]
             [ao 0])
    (cond [(null? l) (cond [(> tk ao) 'Takahashi]
                           [(< tk ao) 'Aoki]
                           [else 'Draw])]
          [else (loop (cdr l) (+ tk (car (car l))) (+ ao (cadr (car l))))])))

(define (main args)
  (let* ([n (read)]
         [l (readm list n list 2 sym)])
    (print (solve l)))
  0)
