#lang survival
(define (my-enemy)
 (custom-enemy #:ai              'medium
               #:sprite          bat-sprite
               #:amount-in-world 5))

(survival-game
#:avatar     (custom-avatar)
#:enemy-list (list (my-enemy)))