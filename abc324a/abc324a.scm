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

(define (solve la)
  (let loop ([l la])
    (cond [(null? (cdr l)) 'Yes]
          [(= (car l) (cadr l)) (loop (cdr l))]
          [else 'No])))

(define (main args)
  (let* ([n (read)]
         [la (readm list n sym)])
    ($ print $ solve la))
  0)
