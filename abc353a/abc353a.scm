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

(define (solve n lh)
  (let1 h (car lh)
        (let loop ([i 2]
                   [l (cdr lh)])
          (cond [(> i n) -1]
                [(> (car l) h) i]
                [else (loop (+ i 1) (cdr l))]))))

(define (main args)
  (let* ([n (read)]
         [lh (readm list n sym)])
    (print (solve n lh)))
  0)
