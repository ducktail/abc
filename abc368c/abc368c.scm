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

(define (solve lh)
  (let loop ([t 0]
             [l lh])
    (match l
      [(h . r) (cond [(>= h 5) (loop (+ t (* 3 (quotient h 5)))
                                     (cons (remainder h 5) r))]
                     [(<= h 0) (loop t r)]
                     [(zero? (remainder (+ t 1) 3)) (loop (+ t 1)
                                                          (cons (- h 3) r))]
                     [else (loop (+ t 1) (cons (- h 1) r))])]
      [_ t])))

(define (main args)
  (let* ([n (read)]
         [lh (readm list n sym)])
    (print (solve lh)))
  0)
