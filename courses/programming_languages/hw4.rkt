#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below

; 1
(define (sequence low high stride)
  (if (> low high)
      null
      (cons low (sequence (+ low stride) high stride))))

; 2
(define (string-append-map xs suffix)
  (map (lambda (x) (string-append x suffix)) xs))

; 3
(define (list-nth-mod xs n)
  (cond [(< n 0) (error "list-nth-mod: negative number")]
        [(null? xs) (error "list-nth-mod: empty list")]
        [#t (car (list-tail xs (remainder n (length xs))))]))

; 4
(define (stream-for-n-steps s n)
  (define (g st acc count)
    (let ([pr (st)])
      (if (<= count 0)
          acc
          (g (cdr pr) (cons (car pr) acc) (- count 1)))))
  (reverse (g s '() n)))

; 5
(define funny-number-stream
  (letrec ([f (lambda (x) (cons
                           (if (= (modulo x 5) 0) (- 0 x) x)
                           (lambda () (f (+ x 1)))))])
    (lambda () (f 1))))

; 6
(define dan-then-dog 
  (letrec ([p (list "dan.jpg" "dog.jpg")]
           [f (lambda(x) (cons (car x) (lambda () (f (reverse x)))))])
    (lambda () (f p))))

; 7
(define stream-add-zero
  (lambda (s)
    (let ([pr (s)])
      (cons (cons 0 (car pr)) (lambda ()  (stream-add-zero (cdr pr)))))))