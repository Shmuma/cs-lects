#!r6rs
(import (rnrs))

(require racket/trace)


(define (f-rec n)
  (if (< n 3)
      n
      (+ (f-rec (- n 1))
         (* 2 (f-rec (- n 2)))
         (* 3 (f-rec (- n 3))))))


(define (f-iter n)
  (define (f-iter-int i fn fn1 fn2)
    (if (< n i)
        fn
        (f-iter-int (+ 1 i)
                    (+ fn (* 2 fn1) (* 3 fn2))
                    fn
                    fn1)))
  (f-iter-int 3 2 1 0))

