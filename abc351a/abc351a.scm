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

(define (solve la lb)
  (- (apply + la) (apply + lb) -1))

(define (main args)
  (let* ([la (readm list 9 sym)]
         [lb (readm list 8 sym)])
    (print (solve la lb)))
  0)
