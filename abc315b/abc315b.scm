(use scheme.vector)

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

(define (solve n vd)
  (let loop ([i 0]
             [rd (quotient (+ 1 (vector-fold + 0 vd)) 2)])
    (if (<= rd (vector-ref vd i)) (format #f "~a ~a" (+ i 1) rd)
        (loop (+ i 1) (- rd (vector-ref vd i))))
    ))

(define (main args)
  (let* ([n (read)]
         [vd (readm vec n sym)])
    (print (solve n vd)))
  0)
