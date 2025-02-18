(define (solve s)
  (*
   (- (char->integer (string-ref s 0)) 48)
   (- (char->integer (string-ref s 2)) 48)))

(define (main args)
  (let1 s (read-line)
        (print (solve s)))
  0)
