(define count-el-in
  (lambda (listy element)
    (cond
      ((empty? listy)
       0)
      ((eq? (first listy) element)
       (+ 1 (count-el-in (rest listy) element)))
      (else
       (count-el-in (rest listy) element)))))

(count-el-in '(1 2 3 1 2 3 2) 1)
(count-el-in '(1 2 3 1 2 3 2) 2)
(count-el-in '(1 2 3 1 2 3 2) 3)
(count-el-in '(1 2 3 1 2 3 2) 4)

(define elections
 (lambda (listy)
   (let ((sorted (sort listy <))
         (majority (ceiling (/ (length listy) 2))))
         
     (cond
       ((even? (length listy))
        ;; look at the median element in the sorted array. if there is
        ;; a majority element in the list it will be the median in the sorted list
        ;; count how many times the candidate appears in listy.
        ;; if it is indeed a majority element return true
        (> (count-el-in sorted (nth sorted (- majority 1))) majority))
       (else
        ;; same but for an array of odd size
        (>= (count-el-in sorted (nth sorted (- majority 1))) majority))))))

(elections '(1 2 1 2 1 1 1))

(elections '(1 1 1 2 2 2))
(elections '(1 1 1 1 2 2 2))
(elections '(1 1 1 2 2 2 2))

(elections '(1 1 1 1 2 2))

(elections '(1 2))
(elections '(1))

(define get-candidate
 (lambda (listy candidate count)
   (cond
     ((empty? listy)
      candidate)
     ((eq? candidate (first listy))
      ;; if the current candidate is the same as the first of listy
      ;; the current candidate is supported by one more person
      (get-candidate (rest listy) candidate (+ 1 count)))
     ((= count 0)
      ;; if the current candidate has no supportes
      ;; the first of listy becomes the new candidate and is supported by one person
      (get-candidate (rest listy) (first listy) 1))
     (else
      ;; the current candidate lost one of its supportes
      (get-candidate (rest listy) candidate (- count 1))))))

(define awesome-elections
  (lambda (listy)
    (let
        ((majority (ceiling (/ (length listy) 2)))) 
      (cond
        ((even? (length listy))
         ;; look at the candidate for majority and count how many times it appears in listy
         ;; if it is indeed a majority element return true
         (> (count-el-in listy (get-candidate listy 0 0)) majority))
        (else
         ;; same but for an array of odd size
         (>= (count-el-in listy (get-candidate listy 0 0)) majority))))))

(newline)

(awesome-elections '(1 2 1 2 1 1 1))

(awesome-elections '(1 1 1 2 2 2))
(awesome-elections '(1 1 1 1 2 2 2))
(awesome-elections '(1 1 1 2 2 2 2))

(awesome-elections '(1 1 1 1 2 2))

(awesome-elections '(1 2))
(awesome-elections '(1))

;;trump has most votes but does not have the majority
(awesome-elections '('trump 'trump 'trump 'hillary 'hillary 'independent))

