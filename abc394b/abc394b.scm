(use scheme.list)
(use scheme.sort)

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
  (string-join (sort-by ls string-length) ""))

(define (main args)
  (let* ([n (read)]
         [ls (readm list n str)])
    (print (solve ls)))
  0)
