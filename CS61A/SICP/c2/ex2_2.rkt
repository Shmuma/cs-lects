#!r6rs
(import (rnrs))

;; line segments on a plane representation

;; Points. Each point consists of pair of integers, x and y
(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

;; Segments. Each segment is a pair of points.
(define (make-segment p1 p2)
  (cons p1 (list p2)))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (car (cdr seg)))

;; midpoint calculation
(define (midpoint-segment seg)
  (define (avg a b)
    (/ (+ a b) 2))
  (let ((p1 (start-segment seg))
        (p2 (end-segment seg)))
    (make-point (avg (x-point p1) (x-point p2))
                (avg (y-point p1) (y-point p2)))))