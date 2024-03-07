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

(define (main args)
  (let1 n (read)
        (do [(i n (- i 1))]
            [(zero? i)]
          (let1 l (readm list n sym)
                (print
                 (string-join
                  (map number->string
                       (cdr
                        (fold-right
                         (^(a b)
                           (if (= a 1)
                               (cons (- (car b) 1) b)
                               (cons (- (car b) 1) (cdr b))))
                         (list n) l))) " ")))))
  0)
