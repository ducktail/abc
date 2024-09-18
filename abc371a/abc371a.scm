(define (main args)
  (let* ([sab (read)]
         [sac (read)]
         [sbc (read)])
    (print (cond [(not (eq? sab sac)) 'A]
                 [(eq? sac sbc) 'B]
                 [else 'C])))
  0)
