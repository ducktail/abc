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

(define (solve ls)
  (match ls
    [('fine 'fine) 4]
    [('fine 'sick) 3]
    [('sick 'fine) 2]
    [else 1]))

(define (main args)
  (let1 ls (readm list 2 sym)
        (print (solve ls)))
  0)
