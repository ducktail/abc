(use util.match)

(define (fatigue l)
  (let loop ([fl 0]
             [l l])
    (match l
      [(a b . r) (loop (+ fl (abs (- a b))) (cons b r))]
      [_ fl])))

(define (main args)
  (let1 n (read)
        (let loop ([i n]
                   [ll '()]
                   [lr '()])
          (cond [(zero? i) (print (+ (fatigue ll) (fatigue lr)))]
                [else (let* ([a (read)]
                             [s (read)])
                        (if (eq? s 'L) (loop (- i 1) (cons a ll) lr)
                            (loop (- i 1) ll (cons a lr))))])))
  0)
