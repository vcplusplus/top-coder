;; for a given list return a list of
;; the sum of each pair of two consecutive elements
;; (consider that the list is appended with a 0)
(define sum-of-two
  (lambda (row)
    (cond
     ((empty? (rest row))
      ;; a list consisting of
      ;; 0 + the last element of the list
      (list (first row)))
     (else
      ;; sum of the first two elements of the list
      ;; and (sum-of-two) for the rest of the list
      (cons (+ (first row) (second row)) (sum-of-two (rest row)))))))

(sum-of-two '(1 4 6 4 1))
(sum-of-two '(1 2 3 4 5))

(define pascal-triangle
  (lambda (n)
    (cond
      ((= 0 n)
       '((1)))
      (else
       ;; generate the pascal triangle of n - 1 lines
       (let* ((pascals (pascal-triangle (- n 1)))
              ;; get the last line of the triangle
              (last-row (first pascals)))
         ;; return the triangle of n lines by generating the
         ;; nth line from the (n-1)th line
         (cons (cons 1 (sum-of-two last-row)) pascals))))))

(pascal-triangle 5)
         