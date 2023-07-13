(use scheme.list)   ;; list library

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

(define (solve lc ld lp)
  (let ([tbl (map cons ld (cdr lp))]
        [p (car lp)])
    (apply + (map (^c
                   (cond [(assq c tbl) => cdr]
                         [else p])) lc))))

(define (main args)
  (let* ([n (read)]
         [m (read)]
         [lc (readm list n sym)]
         [ld (readm list m sym)]
         [lp (readm list (+ m 1) sym)])
    (print (solve lc ld lp)))
  0)
