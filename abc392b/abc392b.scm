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

(define (solve n m am)
  (print (- n m))
  (let loop ([i 1]
             [am (sort am)]
             [ans '()])
    (cond [(> i n) (print (string-join (map number->string (reverse ans)) " "))]
          [(null? am) (loop (+ i 1) am (cons i ans))]
          [(= i (car am)) (loop (+ i 1) (cdr am) ans)]
          [else (loop (+ i 1) am (cons i ans))])))

(define (main args)
  (let* ([n (read)]
         [m (read)]
         [am (readm list m sym)])
    (solve n m am))
  0)
