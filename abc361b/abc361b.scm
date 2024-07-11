(use scheme.list)

(define (intersection l0 h0 l1 h1)
  (max 0 (- (min h0 h1) (max l0 l1))))

(define (solve xl0 yl0 zl0 xh0 yh0 zh0 xl1 yl1 zl1 xh1 yh1 zh1)
  (if (zero? (* (intersection xl0 xh0 xl1 xh1)
                (intersection yl0 yh0 yl1 yh1)
                (intersection zl0 zh0 zl1 zh1))) 'No 'Yes))

(define (main args)
  (let* ([xl0 (read)]
         [yl0 (read)]
         [zl0 (read)]
         [xh0 (read)]
         [yh0 (read)]
         [zh0 (read)]
         [xl1 (read)]
         [yl1 (read)]
         [zl1 (read)]
         [xh1 (read)]
         [yh1 (read)]
         [zh1 (read)])
    (print (solve xl0 yl0 zl0 xh0 yh0 zh0 xl1 yl1 zl1 xh1 yh1 zh1)))
  0)
