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

(define (gomi q r)
  (^d (+ d (modulo (- r d) q))))

(define (solve vqr ltd)
  (map (^(td) ((vector-ref vqr (- (car td) 1)) (cadr td))) ltd))

(define (main args)
  (let* ([n (read)]
         [vqr (vector-tabulate n (^_ (let* ([q (read)]
                                            [r (read)]) (gomi q r))))]
         [q (read)]
         [ltd (readm list q list 2 sym)])
    (for-each print (solve vqr ltd)))
  0)
