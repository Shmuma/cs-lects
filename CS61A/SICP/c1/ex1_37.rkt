#!r6rs
(import (rnrs))

(define (cont-frac n d k)
  (define (cont-frac-i i)
    (if (equal? i k)
        (/ (n i) (d i))
        (/ (n i)
           (+ (d i)
              (cont-frac-i (+ i 1))))))
  (cont-frac-i 1))

(exact->inexact (cont-frac (lambda (i) 1) (lambda (i) 1) 1000))