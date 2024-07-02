(define (main args)
  (let ([l (list 'RSM 'RMS 'SRM)]
        [s (read)])
    (print (if (member s l) 'Yes 'No)))
  0)
