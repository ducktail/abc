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

(define (solve n d s)
  (list->string
   (car
    (fold-right (^(c x)
                  (cond [(zero? (cdr x)) (cons (cons c (car x)) 0)]
                        [(char=? #\@ c) (cons (cons #\. (car x)) (- (cdr x) 1))]
                        [else (cons (cons c (car x)) (cdr x))]))
                (cons '() d)
                (string->list s)))))

(define (main args)
  (let* ([n (read)]
         [d (read)]
         [s (readm str)])
    (print (solve n d s)))
  0)
