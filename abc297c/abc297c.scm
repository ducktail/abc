(use scheme.list)   ;; list library
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

(define (solve s)
  (let1 l (string->list s)
        (list->string
         (let loop ([l l])
           (match l
                  [(x y . ys) (cond [(and (char=? #\T x)
                                          (char=? #\T y)) (cons #\P (cons #\C (loop ys)))]
                                    [(char=? #\. y) (cons x (cons y (loop ys)))]
                                    [else (cons x (loop (cons y ys)))])]
                  [x x])))))

(define (main args)
  (let* ([h (read)]
         [_ (read)]
         [ls (readm list h str)])
    (for-each print (map solve ls)))
  0)
