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

(define (main args)
  (let* ([n (string->number (read-line))]
         [ms (vector-tabulate n (^_ (string->vector (read-line))))])
    (let1 t (v~ ms 0 0)
          (do [(i 0 (+ i 1))]
              [(= i (- n 1))]
            (v-set! (v~ ms i 0) (v~ ms (+ i 1) 0)))
          (do [(i 0 (+ i 1))]
              [(= i (- n 1))]
            (v-set! (v~ ms (- n 1) i) (v~ ms (- n 1) (+ i 1))))
          (do [(i (- n 1) (- i 1))]
              [(zero? i)]
            (v-set! (v~ ms i (- n 1)) (v~ ms (- i 1) (- n 1))))
          (do [(i (- n 1) (- i 1))]
              [(zero? i)]
            (v-set! (v~ ms 0 i) (v~ ms 0 (- i 1))))
          (v-set! (v~ ms 0 1) t))
    (vector-for-each (^v (print (vector->string v))) ms))
  0)
