#lang racket

;adapted from leetcode #20. Valid Parentheses
;input: list (or string)
;output: whether it is symmetric
;note: a symmetric list here is defined to have even length

;remove first and last items
(define (middle lst)
  (reverse (cdr (reverse (cdr lst)))))

(define (symmetric? input pred?)
  (define (f ls);list of chars -> boolean
    (cond [(empty? ls) #t]
          [(odd? (length ls)) #f];can change to make length==1 fit.
          [(pred? (first ls) (last ls)) (f (middle ls))]
          [else #f]))
  (f input))

(define (paren-sym-pred fst lst)
  (member
   (list->string (list fst lst))
   (list "()" "{}" "[]")))

;test cases
;> (symmetric? (list 'a 'b 'c 'd) equal?)
;#f
;> (symmetric? (string->list "{[]}") paren-sym-pred)
;#t
;> (symmetric? (string->list "{[{]}") paren-sym-pred)
;#f
;> (symmetric? (list 3 4 5 5 4 3) =)
;#t