(use scheme.sort)
(use gauche.collection)

(define (main args)
  (let1 ls (string->list (read-line))
        (print (caar
                (list-sort 
                 (^(a b) (if (= (length a) (length b))
                             (char<? (car a) (car b))
                             (> (length a) (length b))))
                 (group-collection ls)))))
  0)
