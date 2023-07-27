(use scheme.list)   ;; list library

(define-syntax v-update!
  (syntax-rules (v~)
    [(_ (v~ v i) f)
     (vector-set! v i (f (vector-ref v i)))]
    [(_ (v~ v i j ...) f)
     (v-update! (v~ (vector-ref v i) j ...) f)]))

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

(define (solve n d ls)
  (let1 v (make-vector d 0)
        (for-each (^s
                   (do [(i 0 (+ i 1))]
                       [(>= i d)]
                     (if (char=? #\o (string-ref s i)) (v-update! (v~ v i) (pa$ + 1))))) ls)
        (let loop ([h 0]
                   [mxh 0]
                   [i 0])
          (cond [(>= i d) (max h mxh)]
                [(= n (vector-ref v i)) (loop (+ h 1) mxh (+ i 1))]
                [else (loop 0 (max h mxh) (+ i 1))]))))

(define (main args)
  (let* ([n (read)]
         [d (read)]
         [ls (readm list n str)])
    (print (solve n d ls)))
  0)
