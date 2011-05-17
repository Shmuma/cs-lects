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


(define (euler n)
  (/ 1
     (cont-frac (lambda (i) 1)
                (lambda (i)
                  (let ((r (remainder i 3))
                        (d (truncate (/ i 3))))
                    (cond ((equal? r 1) 1)
                          ((equal? r 0) 1)
                          (else (* 2 d)))))
                n)))