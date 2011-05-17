#!r6rs
(import (rnrs))

(require racket/trace)

(define (fixed-point f)
  (define (fixed-point-guess guess)
    (display guess)
    (newline)
    (let ((value (f guess)))
      (if (close? value guess)
          guess
          (fixed-point-guess (average guess value)))))
  (exact->inexact (fixed-point-guess 2)))


(define (close? x y)
  (< (abs (- x y)) 0.00000001))


(define (average a b)
  (/ (+ a b) 2))

;; solve x^x=1000
(fixed-point (lambda (x) (/ (log 1000) (log x))))