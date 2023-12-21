(define (to-num x)
  (cond [(char=? x #\A) 0]
        [(char=? x #\B) 1]
        [(char=? x #\C) 2]
        [(char=? x #\D) 3]
        [else 4]))

(define (dist s e)
  (let1 l (abs (- (to-num s) (to-num e)))
        (min l (- 5 l))))

(define (main args)
  (let* ([ls ($ string->list $ read-line)]
         [lt ($ string->list $ read-line)])
    (print (if (= (dist (car ls) (cadr ls)) (dist (car lt) (cadr lt))) 'Yes 'No)))
  0)
