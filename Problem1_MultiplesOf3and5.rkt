#lang racket
(define (is-multiple x y)
  (= 0 (modulo x y)))

(define (sum-multiples-of n1 n2 limit)
  (if (= limit 0)
      0
      (if (or (is-multiple (- limit 1) n1)
              (is-multiple (- limit 1) n2))
            (+ (- limit 1) (sum-multiples-of n1 n2 (- limit 1)))
            (sum-multiples-of n1 n2 (- limit 1)))))

(sum-multiples-of 3 5 10)
(sum-multiples-of 3 5 1000)
