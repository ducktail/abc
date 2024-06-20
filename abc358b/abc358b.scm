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

(define (solve a lt)
  (let loop ([ct 0]
             [l lt]
             [lx '()])
    (cond [(null? l) (reverse lx)]
          [else (let1 nt (+ a (max ct (car l)))
                      (loop nt (cdr l) (cons nt lx)))])))

(define (main args)
  (let* ([n (read)]
         [a (read)]
         [lt (readm list n sym)])
    (for-each print (solve a lt)))
  0)
