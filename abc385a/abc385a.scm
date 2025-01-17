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

(define (solve abc)
  (match (sort abc)
    [(a b c) (if (or (= a c) (= (+ a b) c)) 'Yes 'No)]))

(define (main args)
  (let1 abc (readm list 3 sym)
        (print (solve abc)))
  0)
