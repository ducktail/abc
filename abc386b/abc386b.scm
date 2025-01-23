(define (solve s)
  (string-length(regexp-replace-all #/00/ s "a")))

(define (main args)
  (let1 s (read-line)
        (print (solve s)))
  0)
