(use scheme.list)

(define (main args)
  (let1 n (read)
        (print ($ list->string $ list-tabulate (+ (* n 2) 1) (^i (if (even? i) #\1 #\0)))))
  0)
