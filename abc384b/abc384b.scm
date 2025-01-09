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

(define (solve r lda)
  (fold-left (^[rn da]
               (match da
                 [(1 a) (if (<= 1600 rn 2799) (+ rn a) rn)]
                 [(2 a) (if (<= 1200 rn 2399) (+ rn a) rn)])) r lda))

(define (main args)
  (let* ([n (read)]
         [r (read)]
         [lda (readm list n list 2 sym)])
    (print (solve r lda)))
  0)
