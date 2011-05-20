#!r6rs
(import (rnrs))
(require racket/trace)

(define (fact n)
  (if (= n 1)
      1
      (* n (fact (- n 1)))))

(define (fact2 n)
  (define (fact-iter prod i)
    (if (> i n)
        prod
        (fact-iter (* prod i) (+ i 1))))
  (fact-iter 1 2))
