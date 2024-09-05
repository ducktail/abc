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

(define (solve n v)
  (let1 vc (make-vector n 0)
        (do [(i 0 (+ i 1))]
            [(= i n) (vector-fold + 0 vc)]
          (cond [(zero? i) (vector-set! vc 0 1)]
                [(= i 1) (vector-set! vc 1 2)]
                [(= (- (vector-ref v i) (vector-ref v (- i 1)))
                    (- (vector-ref v (- i 1)) (vector-ref v (- i 2))))
                 (vector-set! vc i (+ 1 (vector-ref vc (- i 1))))]
                [else (vector-set! vc i 2)]))))

(define (main args)
  (let* ([n (read)]
         [va (readm vec n sym)])
    (print (solve n va)))
  0)
