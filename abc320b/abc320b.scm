(use srfi-13)       ;; string library

(define (palindrome? s)
  (string=? s (string-reverse s)))

(define (solve s)
  (let1 los (string-length s)
        (let loop ([li 0]
                   [ri los])
          (cond [(> ri los) (loop 0 (- ri li 1))]
                [(palindrome? (substring s li ri)) (- ri li)]
                [else (loop (+ li 1) (+ ri 1))]))))

(define (main args)
  (let1 s (read-line)
        (print (solve s)))
  0)
