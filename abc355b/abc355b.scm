(use scheme.list)
(use util.match)

(define-syntax readm
  (syntax-rules (sym str list vec)
    [(_ list n t ...)
     (unfold (pa$ = n) (^_ (readm t ...)) (pa$ + 1) 0)]
    [(_ vec n t ...)
     (vector-tabulate n (^_ (readm t ...)))]
    [(_ sym)
     (read)]
    [(_ str)
     (symbol->string (read))]))

(define (merge lx ly)
  (cond [(null? lx) (map (^_ 'b) ly)]
        [(null? ly) (map (^_ 'a) lx)]
        [(< (car lx) (car ly)) (cons 'a (merge (cdr lx) ly))]
        [else (cons 'b (merge lx (cdr ly)))]))

(define (solve la lb)
  (let1 lab (merge (sort la) (sort lb))
        (let loop ([l lab])
          (match l
            [(x y . _) (if (and (eq? x 'a) (eq? y 'a)) 'Yes (loop (cdr l)))]
            [_ 'No]))))

(define (main args)
  (let* ([n (read)]
         [m (read)]
         [la (readm list n sym)]
         [lb (readm list m sym)])
    (print (solve la lb)))
  0)
