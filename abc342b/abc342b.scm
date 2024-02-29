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

(define (solve n lp lq)
  (let1 v (make-vector (+ n 1) 0)
        (let loop ([i 0]
                   [l lp])
          (cond [(= i n) '()]
                [else (vector-set! v (car l) i)
                      (loop (+ i 1) (cdr l))]))
        (map (^(ab) (if (< (vector-ref v (car ab))
                           (vector-ref v (cadr ab)))
                        (car ab) (cadr ab))) lq)))

(define (main args)
  (let* ([n (read)]
         [lp (readm list n sym)]
         [q (read)]
         [lq (readm list q list 2 sym)])
    (for-each print (solve n lp lq)))
  0)
