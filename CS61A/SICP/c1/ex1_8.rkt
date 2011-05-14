#!r6rs
(import (rnrs))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x) x)))

(define (good-enough? guess x)
  (> 0.001 (abs (- x (* guess guess guess)))))

(define (improve guess x)
  (average guess (/ (+ (/ x (* guess guess)) (* 2 guess)) 3)))

(define (average a b)
  (/ (+ a b) 2.0))

(define (cube-root x)
  (cube-root-iter 1 x))
