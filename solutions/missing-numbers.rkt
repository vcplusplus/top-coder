(problem "missing numbers")
;; MISSING NUMBERS (FP)
;; -----------------------------------------------------------------
;; https://www.hackerrank.com/challenges/missing-numbers-fp/problem

;; solution: list of values

(define numeros
  (lambda (m listy1 n listy2)
    (letrec ((numeros-acc
              (lambda (m listy1 n listy2 acc)
                (cond
                  ((or (null? listy1) (null? listy2))
                   (reverse acc))
                  ((eq? (first listy1) (first listy2))
                   (numeros-acc m (rest listy1) n (rest listy2) acc))
                  (else
                   (numeros-acc m
                                (rest listy1)
                                n
                                (rest (remove (first listy2) listy2))
                                (if (member (first listy2) acc)
                                    acc
                                    (cons (first listy2) acc))))))))
      (numeros-acc m listy1 n listy2 '()))))

(tester '(numeros 10 '(203 204 205 206 207 208 203 204 205 206) 13 '(203 204 204 205 206 207 205 208 203 206 205 206 204)))
(newline)