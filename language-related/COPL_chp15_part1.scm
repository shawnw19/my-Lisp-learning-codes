;;scheme learning codes based on
;;Concept of Concept of Programming Languages ;;,Robert Sebesta ,11e Chapter 15
;;15.5.1 - 15.5.9

;defining functions
((lambda (x) (* x x)) 7)
(define pi 3.14159)
(define two_pi (* 2 pi))
two_pi; return 6.28318
;
(define (square number) (* number number))
(square 5.5)
;example of numeric predicate functions
(= 1.2 1.2); return #t
(<= 1.1 1.3)
(EVEN? 129)
(zero? 0) ;0.0 is also zero
;control flow
(display "# Two examples of control flow: ")
(define (factorial n)
  (if (<= n 1) ;one parenthesis on the right 
  1; can be written at the end of last line
  (* n (factorial (- n 1)))
  ))
;
(display "\n")
(factorial 5)
(factorial 3)
;cond structure (similar to switch in C-like)

(define (leap? year)
  (COND
      ((zero? (modulo year 400)) #T)
      ((zero? (modulo year 100)) #F)
      (else (zero? (modulo year 4)))
      ))
;
(leap? 1900)
;list functions
(quote (A B c)) ;unquoting results in "cannot reference an identifier before its definition"
(car '((a b)c d))
(cdr '((a b)c d))
(cons 'A '());cons concatenate two lists
(cons '(D E) '(F G)) ;only and must be two args
(define a_list (cons 1 3))
(cons (car a_list) (cdr a_list)) ;returns (1 . 3)
(cons 'a 'b)
(list 'apple 'orange 'grape)

;predicate functions for atoms and lists
(eq? 'a 'a)
(eq? 'a 'c)
(eq? 3.4 (+ 3 0.4)) ;differnet memory location
(eqv? 3.4 (+ 3 0.4))
(list? '(x y))
(list? '())
(null? 'm) ;returns #f
(null? '()) ;but '(()) is not null
