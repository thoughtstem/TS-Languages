#lang battle-arena
(define (my-enemy)
 (custom-enemy #:ai              'easy
               #:health          200
               #:shield          100
               #:amount-in-world 10))

(battle-arena-game
#:enemy-list (list (my-enemy)))