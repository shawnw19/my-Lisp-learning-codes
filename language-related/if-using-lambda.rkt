#lang racket
;a demonstration of selection structure
;using only lambda calculus.

;adapted from tutorials https://youtu.be/66K9ZxZM64Q?t=1931
;and https://github.com/glebec/lambda-talk

;The nitty-gritty of this "mysterious"
;technique is 1. all input parameters/varaibles
;are kept for further usage, which makes it possible for
;lambda(ELSE) to return THEN; 2. ELSE and THEN are assigned
;arbitrarily as a convention based on relative location that
;ELSE is the left (earlier) and THEN is the right (latter).



(define (IF BOOL)
  (λ(THEN)
    (λ(ELSE)
      ((BOOL THEN)
       ELSE))))

(define (TRUE THEN)
  (λ(ELSE)
    THEN))

(define (FALSE THEN)
  (λ(ELSE)
    ELSE))


;> (((IF TRUE) 1) 2)
;1
;> (((IF FALSE) 1) 2)
;2

(define pi>3 TRUE)

; t: "Pi is larger than 3."); f: "Pi is lesser than 3.")

 (define apply-IF
   (λ(boolean t f)
     (((IF boolean) t) f)))

;> (apply-IF pi>3 "Pi is larger than ;3." "Pi is lesser than 3.")
;"Pi is larger than 3."

(define sky-is-gray FALSE)

;> (apply-IF sky-is-gray "I will ;cry..." "Cheer up!")
;"Cheer up!"
