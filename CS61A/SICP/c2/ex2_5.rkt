#!r6rs
(import (rnrs))

(require rnrs/base-6)

;; pair of numbers as 2^a * 3^b

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car p)
  (define (two-powers p n)
    (if (zero? (mod p 2))
        (two-powers (/ p 2) (+ n 1))
        n))
  (two-powers p 0))

(define (cdr p)
  (define (three-powers p n)
    (if (zero? (mod p 3))
        (three-powers (/ p 3) (+ n 1))
        n))
  (three-powers p 0))
