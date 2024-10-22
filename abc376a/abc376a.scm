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

(define (solve c lt)
  (let loop ([ct 0]
             [gt (* -1 c)]
             [l lt])
    (cond [(null? l) ct]
          [(<= (+ gt c) (car l)) (loop (+ ct 1) (car l) (cdr l))]
          [else (loop ct gt (cdr l))])))

(define (main args)
  (let* ([n (read)]
         [c (read)]
         [lt (readm list n sym)])
    (print (solve c lt)))
  0)
