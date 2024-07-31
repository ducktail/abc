(define (solve h w si sj vc sx)
  (let loop ([r (- si 1)]
             [c (- sj 1)]
             [i 0])
    (cond [(= i (string-length sx)) (format #f "~a ~a" (+ r 1) (+ c 1))]
          [(and (char=? #\L (string-ref sx i))
                (< 0 c)
                (char=? #\. (~ vc r (- c 1)))) (loop r (- c 1) (+ i 1))]
          [(and (char=? #\R (string-ref sx i))
                (< c (- w 1))
                (char=? #\. (~ vc r (+ c 1)))) (loop r (+ c 1) (+ i 1))]
          [(and (char=? #\U (string-ref sx i))
                (< 0 r)
                (char=? #\. (~ vc (- r 1) c))) (loop (- r 1) c (+ i 1))]
          [(and (char=? #\D (string-ref sx i))
                (< r (- h 1))
                (char=? #\. (~ vc (+ r 1) c))) (loop (+ r 1) c (+ i 1))]
          [else (loop r c (+ i 1))])))

(define (main args)
  (let* ([p (open-input-string (read-line))]
         [h (read p)]
         [w (read p)]
         [p (open-input-string (read-line))]
         [si (read p)]
         [sj (read p)]
         [vc (vector-tabulate h (^_ (read-line)))]
         [sx (read-line)])
    (print (solve h w si sj vc sx)))
  0)
