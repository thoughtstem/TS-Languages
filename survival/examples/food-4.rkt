#lang racket

(require ts-kata-util survival)
 
(define-kata-code survival food-4

  (define (my-food)
    (custom-food #:sprite          apples-sprite
                 #:name            "Apple"
                 #:amount-in-world 2
                 #:heals-by        20))

  (define (special-food)
    (custom-food #:sprite          cherry-sprite
                 #:name            "Cherry"
                 #:amount-in-world 1
                 #:heals-by        50
                 #:respawn?        #f))

  (survival-game
   #:avatar     (custom-avatar)
   #:food-list  (list (my-food)
                      (special-food))))
  