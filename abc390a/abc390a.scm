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

(define (solve ls)
  (let1 lls '((2 1 3 4 5)
              (1 3 2 4 5)
              (1 2 4 3 5)
              (1 2 3 5 4))
        (if (member ls lls) 'Yes 'No)))

(define (main args)
  (let1 ls (readm list 5 sym)
        (print (solve ls)))
  0)
