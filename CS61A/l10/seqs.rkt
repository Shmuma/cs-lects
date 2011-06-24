#!r6rs
(import (rnrs))
(require rnrs/base-6)

;; invalid version of list reversal
(define (reverse1 seq)
  (if (null? seq)
      '()
      (cons (reverse1 (cdr seq)) (car seq))))

;; correct one
(define (reverse2 seq)
  (define (rev in out)
    (if (null? in)
        out
        (rev (cdr in) (cons (car in) out))))
  (rev seq '()))