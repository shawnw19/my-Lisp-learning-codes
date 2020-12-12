;;Scheme learning codes based on
;;Concept of Concept of Programming Languages ;;,Robert Sebesta ,11e Chapter 15
;;15.5.10 - 15.5.14

;5.10 example Scheme functions
;;simple list
(member 'B '(A C E)) ;returns #f
;;the complete function member
(define (ismember atm a_list)
  (cond
    ((null? a_list) #f)
    ((eq? atm (car a_list)) #t)
   (else (ismember atm (cdr a_list)))
    ))
;test_ismember
(ismember 'X '(X Y Z))

;; equal functions that evaluates any two lists/atoms
(define (equal list1 list2)
(cond
  ((not (list? list1))(eq? list1 list2));for atom-list1
  ((not (list? list2)) #f);for list-list1 but non-list list2
  ((null? list1) (null? list2))
  ((null? list2) #f)
  ((equal (car list1) (car list2))
          (equal (cdr list1) (cdr list2)))
  (else #f)
  ));close cond and the function
;test_equal
(equal 'A 'B)
(equal 'B 'B)
(equal '(A D) '(A F))
(equal '(A D H) '(a d h))
;;
(append '(a b) '(c d r))
;;
(define (doappend list1 list2)
  (cond
     ((null? list1) list2)
     (else (cons (car list1) (append (cdr list1) list2)))
     ))
(doappend '(a b c) '(d e f))
;;guess - return common elements
(define (guess list1 list2)
  (cond
    ((null? list1) '())
    ((member (car list1) list2)
             (cons (car list1) (guess (cdr list1) list2)))
    (else (guess (cdr list1) list2))
    ))
;;guess_test
(guess '() '(Z))
(guess '(c d) '())
(guess '(c d e f) '(c e h i))

;5.11 let
(let ((alpha 7)) (* 5 alpha))
;;equals to ((lambda (alpha) (* 5 alpha)) 7)

;tail recursion
(define (ismember atm a_list)
  (cond
    ((null? a_list) #f)
    ((eq? atm (car a_list)) #t)
   (else (ismember atm (cdr a_list)))
    ))
;;tail-recursioned factorial
(define (facthelper n factpartial)
  (if (<= n 1)
      factpartial
      (facthelper (- n 1) (* n factpartial))
   ))
(define (factorial n)
   (facthelper n 1))
;;test_factorial
(factorial 5)

;5.13 functional forms
;;composition
(define (compose f g) (lambda (x) (f (g x))))
;;
((compose car cdr) '((a b) c d)); returns c
;;apply-to all form - map
;;two params - a function and a list
;;applies to each element and returns a list
(map (lambda (num) (* num num num)) '(3 4 2 6))

;5.14 functions that build code - eval
;;an alternative to car and cdr based list addition
(define (adder a_list)
  (cond
    ((null? a_list) 0)
    (else (eval (cons '+ a_list) (scheme-report-environment 5) ))
 ))
;;see
;;https://people.csail.mit.edu/jaffer/r5rs_8.html#6.5
;;and https://practical-scheme.net/wiliki/schemexref.cgi?scheme-report-environment
(adder '(3 4 5))
(eval '(+ 3 4) (scheme-report-environment 5))
