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

(define (solve n k la)
  (receive (x y) (split-at la (- n k))
    (append y x)))

(define (main args)
  (let* ([n (read)]
         [k (read)]
         [la (readm list n sym)])
    (print (string-join (map number->string (solve n k la)) " ")))
  0)
