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
      [(a b c . _) (if (and (= a b) (= b c)) 'Yes (loop (cdr l)))]
      [_ 'No])))

(define (main args)
  (let* ([n (read)]
         [la (readm list n sym)])
    (print (solve la)))
  0)
