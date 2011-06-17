#!r6rs
(import (rnrs))
(require racket/trace)

(define (square x)
  (* x x))

(define (squares sent)
  (if (empty? sent)
      '()
      (cons (square (car sent))
            (squares (cdr sent)))))