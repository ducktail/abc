(use scheme.list)
(use srfi-42)       ;; eager comprehensions
(use util.match)

(define (dist a b)
  (match a
    [(xa . ya) (match b
                 [(xb . yb) (+ (abs (- xa xb)) (abs (- ya yb)))])]))

(define (solve h w d mp)
  (let1 vp (vector-ec (: i 0 h) (: j 0 w) (if (char=? #\. (string-ref (vector-ref mp i) j))) (cons i j))
        (let1 n (vector-length vp)
              (let loop ([i 0]
                         [j 1]
                         [k 0]
                         [c 0]
                         [mc 0])
                (cond [(>= i n) mc]
                      [(>= j n) (loop (+ i 1) (+ i 2) 0 0 mc)]
                      [(>= k n) (loop i (+ j 1) 0 0 (max c mc))]
                      [(or (>= d (dist (vector-ref vp i) (vector-ref vp k)))
                           (>= d (dist (vector-ref vp j) (vector-ref vp k))))
                       (loop i j (+ k 1) (+ c 1) mc)]
                      [else (loop i j (+ k 1) c mc)])))))

(define (main args)
  (let* ([h (read)]
         [w (read)]
         [d (read)]
         [_ (read-line)]
         [mp (vector-tabulate h (^_ (read-line)))])
    (print (solve h w d mp)))
  0)
