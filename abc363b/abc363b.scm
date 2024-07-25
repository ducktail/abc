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

(define (flip f x y)
  (f y x))

(define (solve n t p ll)
  ($ max 0 $ - t $ car $ flip drop (- n p) $ sort ll))

(define (main args)
  (let* ([n (read)]
         [t (read)]
         [p (read)]
         [ll (readm list n sym)])
    (print (solve n t p ll)))
  0)
