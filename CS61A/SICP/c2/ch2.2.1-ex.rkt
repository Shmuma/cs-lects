;; excercises to chapter 2.2.1

#!r6rs
(import (rnrs))
(require racket/trace)
(require rnrs/base-6)

;; ex 2.17
(define (last-pair l)
  (if (null? (cdr l))
      l
      (last-pair (cdr l))))

;; ex 2.18
(define (reverse seq)
  (define (rev in out)
    (if (null? in)
        out
        (rev (cdr in) (cons (car in) out))))
  (rev seq '()))


;; ex 2.19
(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define no-more? null?)
(define first-denomination car)
(define except-first-denomination cdr)

;; ex 2.20
(define (same-parity f . vals)
  (let ((odd (odd? f)))
    (cons f
          (filter (lambda (v) (eq? odd (odd? v))) vals))))
