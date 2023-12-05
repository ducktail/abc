(define (main args)
  (let* ([mm (read)]
         [dd (read)]
         [y (read)]
         [m (read)]
         [d (read)])
    (cond [(and (= mm m) (= dd d)) (format #t "~a ~a ~a~%" (+ y 1) 1 1)]
          [(= dd d) (format #t "~a ~a ~a~%" y (+ m 1) 1)]
          [else (format #t "~a ~a ~a~%" y m (+ d 1))]))
  0)
