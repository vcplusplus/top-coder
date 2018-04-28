;; las = look and say
;; USAGE: (next-las n (first n) 0)
;; meaning get the next las number from n, knowing that you see the first digit of n 0 times before you start
(define next-las
  (lambda (n digit times)
    (cond
      ((empty? n)
       ;; how many times you saw the last element, which element
       ;;list of times what(s)
       (list times digit))
      ((eq? (first n) digit)
       ;; if you see one more element equal to what count it
       (next-las (rest n) digit (+ 1 times)))
      (else
       ;; return (list times digit and the next las number from rest of n
       ;; where you see the first of n 1 times
       (cons times (cons digit (next-las (rest n) (first n) 1)))))))
       
(next-las '(1 1 1) 1 0)
(next-las '(1 2 1 2) 1 0)
(next-las '(1 1 2 2 1 1) 1 0)
      
       
(define look-and-say
  (lambda (n)
    (cond
      ((= n 0)
       '(1))
      (else
       (let ((prev-las (look-and-say (- n 1))))
         ;; get the next look and say number from the previous one
         (next-las prev-las (first  prev-las) 0))))))

(newline)

(look-and-say 0)
(look-and-say 1)
(look-and-say 2)
(look-and-say 3)
(look-and-say 4)
(look-and-say 5)
(look-and-say 6)
(look-and-say 7)
