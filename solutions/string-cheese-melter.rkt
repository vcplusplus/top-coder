(define string-cheese-melter
  (lambda (gouda cheddar)
    (list->string (string-cheese-melter-helper (string->list gouda)
                                               (string->list cheddar)))))

(define string-cheese-melter-helper
  (lambda (gouda cheddar)
    (if (empty? gouda)
        '()
        (append (list (first gouda) (first cheddar))
                (string-cheese-melter-helper (rest gouda) (rest cheddar))))))