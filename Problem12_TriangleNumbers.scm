;#lang racket
#lang planet neil/sicp ;this line needed for DrRacket
; comment both lines above this point to be MIT-Scheme compatible.

(define (divides? n d)
  (if (= 0 d)
      #f
      (= (remainder n d) 0)))

(define (gettriangle n)
  (/ (* n (+ n 1)) 2))


(define (numfactorsof n)
  (define (factors-i d count)
    (cond ((> d (sqrt n)) count)
          ((divides? n d) (factors-i (inc d) (+ 2 count)))
          (else (factors-i (inc d) count))))
  (factors-i 1 0))

(define (findfactorlimit seed x)
  (define (finder-i i)
    (let* ((t (gettriangle i))
           (nft (numfactorsof t)))
;      (display i)  
;      (display " ")
;      (display t)
;      (display " ")
;      (display nft)
;      (display " ")
;      (display x)
;      (display "\n")
      (if (>= nft x)
          t
          (finder-i (inc i)))))
  (finder-i seed))

;(findfactorlimit 12374 500)
(findfactorlimit 1 500)
