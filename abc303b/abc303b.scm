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

(define (solve n m va)
  (let1 vm (vector-tabulate (+ n 1) (^_ (make-vector (+ n 1) #t)))
        (do [(i 0 (+ i 1))]
            [(>= i m)]
          (do [(j 0 (+ j 1))]
              [(>= j (- n 1))]
            (v-set! (v~ vm (v~ va i j) (v~ va i (+ j 1))) #f)
            (v-set! (v~ vm (v~ va i (+ j 1)) (v~ va i j)) #f)))
        (let loop ([i 1]
                   [j 2]
                   [ct 0])
          (cond [(>= i n) ct]
                [(> j n) (loop (+ i 1) (+ i 2) ct)]
                [(v~ vm i j) (loop i (+ j 1) (+ ct 1))]
                [else (loop i (+ j 1) ct)]))))

(define (main args)
  (let* ([n (read)]
         [m (read)]
         [va (readm vec m vec n sym)])
    (print (solve n m va)))
  0)
