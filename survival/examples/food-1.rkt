#lang racket

(require ts-kata-util survival)

(define-kata-code survival food-1

  (survival-game
   #:avatar     (custom-avatar)
   #:food-list  (list (custom-food #:amount-in-world 10))))