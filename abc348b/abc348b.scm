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

(define (solve n vp)
  (let* ([vi (make-vector n 0)]
         [vl (make-vector n 0)])
    (do [(i 0 (+ i 1))]
        [(= i n) vi]
      (do [(j (+ i 1) (+ j 1))]
          [(= j n)]
        (match (v~ vp i)
          [(ix iy) (match (v~ vp j)
                     [(jx jy) (let1 l2 (+ (expt (- ix jx) 2)
                                          (expt (- iy jy) 2))
                                    (cond [(or (> l2 (v~ vl i))
                                               (and (= l2 (v~ vl i))
                                                    (< j (v~ vi i))))
                                           (v-set! (v~ vi i) j)
                                           (v-set! (v~ vl i) l2)])
                                    (cond [(or (> l2 (v~ vl j))
                                               (and (= l2 (v~ vl j))
                                                    (< i (v~ vi j))))
                                           (v-set! (v~ vi j) i)
                                           (v-set! (v~ vl j) l2)]))])])))))

(define (main args)
  (let* ([n (read)]
         [vp (readm vec n list 2 sym)])
    (vector-for-each (^x (print (+ x 1))) (solve n vp)))
  0)
