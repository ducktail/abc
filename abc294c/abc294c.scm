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

(define (solve la lb)
  (let loop ([lx '()]
             [ly '()]
             [i 1]
             [la la]
             [lb lb])
    (match la
           [() (match lb
                      [() (list (string-join ($ map number->string $ reverse lx) " ")
                                (string-join ($ map number->string $ reverse ly) " "))]
                      [(b . bs) (loop lx (cons i ly) (+ i 1) '() bs)])]
           [(a . as) (match lb
                            [() (loop (cons i lx) ly (+ i 1) as '())]
                            [(b . bs) (if (< a b) (loop (cons i lx) ly (+ i 1) as lb)
                                          (loop lx (cons i ly) (+ i 1) la bs))])])))

(define (main args)
  (let* ([n (read)]
         [m (read)]
         [la (readm list n sym)]
         [lb (readm list m sym)])
    (for-each print (solve la lb)))
  0)
