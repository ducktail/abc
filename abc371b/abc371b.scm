(use scheme.list)

(define-syntax list-tabulate
  (syntax-rules ()
    [(_ n f)
     (unfold (pa$ = n) f (pa$ + 1) 0)]))

(define (solve n lab)
  (let1 v (make-vector (+ n 1) 0)
        (map (^(ab) (cond [(eq? (cdr ab) 'F) 'No]
                          [(zero? (vector-ref v (car ab))) (vector-set! v (car ab) 1) 'Yes]
                          [else 'No])) lab)))

(define (main args)
  (let* ([n (read)]
         [m (read)]
         [lab (list-tabulate m (^_ (let* ([a (read)][b (read)]) (cons a b))))])
    (for-each print (solve n lab)))
  0)
