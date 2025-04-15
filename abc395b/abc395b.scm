(define (solve n)
  (let1 fld (vector-tabulate n (^_ (make-string n #\.)))
        (letrec ([paint (^(i j)
                          (do [(c i (+ c 1))]
                              [(> c j)]
                            (string-set! (vector-ref fld i) c #\#))
                          (do [(c i (+ c 1))]
                              [(> c j)]
                            (string-set! (vector-ref fld j) c #\#))
                          (do [(r i (+ r 1))]
                              [(> r j)]
                            (string-set! (vector-ref fld r) i #\#))
                          (do [(r i (+ r 1))]
                              [(> r j)]
                            (string-set! (vector-ref fld r) j #\#))
                          )])
          (let loop ([ul 0]
                     [lr (- n 1)])
            (cond [(> ul lr) fld]
                  [else (paint ul lr)
                        (loop (+ ul 2) (- lr 2))])))))
          

(define (main args)
  (let1 n (read)
        (vector-for-each print (solve n)))
  0)
