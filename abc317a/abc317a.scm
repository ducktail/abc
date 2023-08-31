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

(define (solve d vp)
  (do [(i 0 (+ i 1))]
      [(>= (vector-ref vp i) d) (+ i 1)]))

(define (main args)
  (let* ([n (read)]
         [h (read)]
         [x (read)]
         [vp (readm vec n sym)])
    (print (solve (- x h) vp)))
  0)
