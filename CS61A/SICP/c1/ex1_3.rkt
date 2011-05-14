#!r6rs
(import (rnrs))

(define (square x)
  (* x x))

(define (my-second a b c)
  (let ((x (max a b c))
        (y (min a b c)))
    (- (+ a b c)
       (+ x y))))

(define (sum-square a b c)
  (+ (square (max a b c))
     (square (my-second a b c))))