#lang racket

(require ts-kata-util survival)
 
(define-kata-code survival coin-1

  (survival-game
   #:avatar     (custom-avatar)
   #:coin-list  (list (custom-coin))))