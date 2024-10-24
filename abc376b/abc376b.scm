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

(define (solve n lht)
  (define (dst s d g)
    (cond [(and (< s d) (< s g d)) (- (+ n s) d)]
          [(< s d) (- d s)]
          [(> s g d) (- (+ n d) s)]
          [else (- s d)]))
  (let loop ([ct 0]
             [l 1]
             [r 2]
             [ll lht])
    (match ll
      [() ct]
      [(('L t) . rs) (loop (+ ct (dst l t r)) t r rs)]
      [(('R t) . rs) (loop (+ ct (dst r t l)) l t rs)])))

(define (main args)
  (let* ([n (read)]
         [q (read)]
         [lht (readm list q list 2 sym)])
    (print (solve n lht)))
  0)
