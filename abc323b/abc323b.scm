(use scheme.list)
(use scheme.sort)

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

(define (solve ls)
  (map cdr
       (list-sort (^(a b) (if (= (car a) (car b)) (< (cdr a) (cdr b)) (> (car a) (car b))))
                  (let loop ([l '()]
                             [ls ls]
                             [i 1])
                    (cond [(null? ls) l]
                          [else (loop (cons
                                       (cons
                                        (length (filter (pa$ char=? #\o)
                                                        (string->list (car ls)))) i) l) (cdr ls) (+ i 1))])))))

(define (main args)
  (let* ([n (read)]
         [ls (readm list n str)])
    (print
     (string-join
      ($ map number->string $ solve ls) " ")))
  0)
