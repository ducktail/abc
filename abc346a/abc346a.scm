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
  (let loop ([l la])
    (match l
      [(x y . z) (cons (* x y) (loop (cons y z)))]
      [_ '()])))

(define (main args)
  (let* ([n (read)]
         [la (readm list n sym)])
    (print (string-join (map number->string (solve la)) " ")))
  0)
