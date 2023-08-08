(use scheme.list)   ;; list library
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

(define (solve n lp)
  (if (= n 1) 0 (match lp [(p . lp) (max 0 (- (apply max lp) -1 p))])))

(define (main args)
  (let* ([n (read)]
         [lp (readm list n sym)])
    (print (solve n lp)))
  0)
