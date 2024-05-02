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

(define (solve n a b)
  (do [(i 0 (+ i 1))]
      [(= i n)]
    (do [(j 0 (+ j 1))]
        [(= j n)]
      (if (not (char=? (~ a i j) (~ b i j)))
          (format #t "~a ~a~%" (+ i 1) (+ j 1))))))

(define (main args)
  (let* ([n (read)]
         [va (readm vec n str)]
         [vb (readm vec n str)])
    (solve n va vb))
  0)
