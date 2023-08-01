(define (main args)
  (let1 s (read)
        (print (if (member s '(ACE BDF CEG DFA EGB FAC GBD)) 'Yes 'No)))
  0)
