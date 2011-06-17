#!r6rs
(import (rnrs))

(require racket/trace)

(define (my-sort sent)
  (if (empty? sent)
      '()
      (insert (car sent)
              (my-sort (cdr sent)))))

(define (insert num sent)
  (cond ((empty? sent)
         (list num))
        ((< num (car sent))
         (cons num sent))
        (else
         (cons (car sent)
               (insert num (cdr sent)))))
  )