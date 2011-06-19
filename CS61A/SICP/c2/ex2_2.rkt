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

;; Segment length along X and Y axises
(define (x-len-segment seg)
  (- (x-point (end-segment seg))
     (x-point (start-segment seg))))

(define (y-len-segment seg)
  (- (y-point (end-segment seg))
     (y-point (start-segment seg))))

;; Rectangles. Represented by segment of bottom-left to top-right corners.
(define (make-rectangle bot-left-pt top-right-pt)
  (make-segment bot-left-pt top-right-pt))

(define (bot-left-rectangle rect)
  (start-segment rect))

(define (top-right-rectangle rect)
  (end-segment rect))

(define (dagonal-rectangle rect)
  rect)

;; utility routines
(define (perimeter-rectangle rect)
  (let ((x-len (x-len-segment (diagonal-rectangle rect)))
        (y-len (y-len-segment (diagonal-rectangle rect))))
    (+ (* 2 x-len)
       (* 2 y-len))))

(define (area-rectangle rect)
  (* (x-len-segment (diagonal-rectangle rect))
     (y-len-segment (diagonal-rectangle rect))))
