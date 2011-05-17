#!r6rs
(import (rnrs))


(define (cont-frac n d k)
  (define (cont-frac-i i)
    (if (equal? i k)
        (/ (n i) (d i))
        (/ (n i)
           (+ (d i)
              (cont-frac-i (+ i 1))))))
  (exact->inexact (cont-frac-i 1)))


(define (tan-cf x k)
  (cont-frac (lambda (i) 
               (- (expt x i)))
             (lambda (i) (- (* 2 x) 1))
             k))


