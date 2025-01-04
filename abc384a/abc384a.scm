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

(define (solve c1 c2 s)
  (string-join
   (map (^c (if (string=? c c1) c1 c2)) (string-split s ""))""))

(define (main args)
  (let* ([_ (read)]
         [c1 (readm str)]
         [c2 (readm str)]
         [s (readm str)])
    (print (solve c1 c2 s)))
  0)
