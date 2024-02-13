(use scheme.list)

(define (main args)
  (let* ([a (read)]
         [b (read)]
         [d (read)])
    (print
     (string-join
      (unfold (cut > <> b) number->string (pa$ + d) a) " ")))
  0)
