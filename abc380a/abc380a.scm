(use scheme.list)

(define-syntax v-update!
  (syntax-rules (v~)
    [(_ (v~ v i) f)
     (vector-set! v i (f (vector-ref v i)))]
    [(_ (v~ v i j ...) f)
     (v-update! (v~ (vector-ref v i) j ...) f)]))

(define (solve n)
  (let1 l (unfold zero? (cut remainder <> 10) (cut quotient <> 10) n)
        (let1 c (make-vector 10 0)
              (for-each (^x (v-update! (v~ c x) (pa$ + 1))) l)
              (if (and (= (vector-ref c 1) 1)
                       (= (vector-ref c 2) 2)
                       (= (vector-ref c 3) 3)) 'Yes 'No))))

(define (main args)
  (let1 n (read)
        (print (solve n)))
  0)
