#lang racket

;counterpart of zip() in Python

(define (zip keys values)
  (define ht (make-hash))
  (map (λ(k v) (hash-set! ht k v)) keys values)
  ht)

;> (zip (list 1 2 3) (list "one" "two" "three"))
;'#hash((1 . "one") (2 . "two") (3 . "three"))

;Exercise 3 https://berkeley-cs61as.github.io/textbook/homework-4.html
;eg. -> (my-substitute2 '((4 calling birds) (3 french hens) (2 turtle doves))
                   ;'(1 2 3 4)
                   ;'(one two three four))
;((four calling birds) (three french hens) (two turtle doves))
;have solution consulted https://github.com/nicolov/cs61as-racket-homework/blob/master/hw4.rkt

(define (atom? x)
  (nor (null? x)
       (list? x)))

(define (atomic-replace in hashtable)
    ;returns original input if not replacebale
    (let ([v (hash-ref hashtable in #f)]);if no key returns #f, see syntax
      (if v v in)))

(define (deep-replace input keys values)
  (define ht (zip keys values))
  (cond [(null? input) input];necessary for list processing
        [(atom? input) (atomic-replace input ht)]
        [else (cons (deep-replace (car input) keys values) (deep-replace (cdr input) keys values))]))

;version2

(define (substitute2 input keys values)
  (define (atom? x) (nor (null? x) (list? x)))
  (define (atomic-replace in hashtable)
    (let ([v (hash-ref hashtable in #f)])
      (if v v in)))
  (define ht (zip keys values))
  (define (replace inp)
    (cond [(null? inp) inp]
          [(atom? inp) (atomic-replace inp ht)]
          [else (cons (replace (car inp)) (replace (cdr inp)))]))
  (replace input))

;test example

;> (substitute2 '((When I was little) (I would go on Games .com) (to play)) (list 'little 'Games 'play) (list 'young 'knowledge 'study))
;'((When I was young) (I would go on knowledge .com) (to study))