#!r6rs
(import (rnrs))
(require racket/trace)

(define (buzz n)
  (cond ((zero? (remainder n 7)) 'buzz)
        ((member? 7 n) 'buzz)
        (else n)))


(define (member? dig number)
  (cond ((zero? number) (zero? dig))
        ((equal? (remainder number 10) dig) #t)
        ((zero? (truncate (/ number 10))) #f)
        (else (member? dig (truncate (/ number 10))))))

