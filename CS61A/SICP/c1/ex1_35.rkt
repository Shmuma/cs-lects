#!r6rs
(import (rnrs))

(require racket/trace)

(define (fixed-point f)
  (define (fixed-point-guess guess)
    (let ((value (f guess)))
      (if (close? value guess)
          guess
          (fixed-point-guess (average guess value)))))
  (exact->inexact (fixed-point-guess 1)))


(define (close? x y)
  (< (abs (- x y)) 0.00000001))


(define (average a b)
  (/ (+ a b) 2))

;; calculate golden ratio value
(fixed-point (lambda (x) (+ 1 (/ 1 x))))