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

(define (solve d ltd)
  (map
   (^k
    (apply max
     (map
      (^(td) (match td
               [(t d) (* t (+ d k))]))
      ltd)))
   (iota d 1)))

(define (main args)
  (let* ([n (read)]
         [d (read)]
         [ltd (readm list n list 2 sym)])
    (for-each print (solve d ltd)))
  0)
