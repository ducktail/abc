(use scheme.list)
(use util.match)

(define-syntax v~
  (syntax-rules ()
    [(_ v i)
     (vector-ref v i)]
    [(_ v i j ...)
     (v~ (vector-ref v i) j ...)]))

(define-syntax v-set!
  (syntax-rules (v~)
    [(_ (v~ v i) val)
     (vector-set! v i val)]
    [(_ (v~ v i j ...) val)
     (v-set! (v~ (vector-ref v i) j ...) val)]))

(define-syntax v-update!
  (syntax-rules (v~)
    [(_ (v~ v i) f)
     (vector-set! v i (f (vector-ref v i)))]
    [(_ (v~ v i j ...) f)
     (v-update! (v~ (vector-ref v i) j ...) f)]))

(define-syntax range-fold-left
  (syntax-rules ()
    [(_ f iv si ei)
     (let loop ([i si]
                [v iv])
       (if (= i ei) v
           (loop (+ i 1) (f v i))))]))

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

(define (solve lr)
  (let1 v (vector-tabulate 101 (^_ (make-vector 101 0)))
        (do [(l lr (cdr l))]
            [(null? l)]
          (match (car l)
                 [(a b c d)
                  (v-update! (v~ v a c) (pa$ + 1))
                  (v-update! (v~ v b d) (pa$ + 1))
                  (v-update! (v~ v a d) (cut - <> 1))
                  (v-update! (v~ v b c) (cut - <> 1))]
                 ))
        (do [(y 0 (+ y 1))]
            [(> y 100)]
          (do [(x 0 (+ x 1))]
              [(> x 99)]
            (v-set! (v~ v (+ x 1) y) (+ (v~ v x y) (v~ v (+ x 1) y)))))
        (do [(x 0 (+ x 1))]
            [(> x 100)]
          (do [(y 0 (+ y 1))]
              [(> y 99)]
            (v-set! (v~ v x (+ y 1)) (+ (v~ v x y) (v~ v x (+ y 1))))))
        (range-fold-left
         (^(i x)
           (range-fold-left
            (^(j y)
              (if (> (v~ v x y) 0) (+ j 1) j)) i 0 101))
         0 0 101)))

(define (main args)
  (let* ([n (read)]
         [lr (readm list n list 4 sym)])
    (print (solve lr)))
  0)
