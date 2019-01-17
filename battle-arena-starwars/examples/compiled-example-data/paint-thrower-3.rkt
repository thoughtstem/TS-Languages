#lang battle-arena-starwars
(define (my-paint)
 (paint #:damage     10
        #:durability 20))

(define (my-weapon-3)
 (custom-weapon #:name   "Paint Thrower"
                #:sprite STUDENT-IMAGE-HERE
                #:dart   (my-paint)
                #:rarity 'epic))

(starwars-game
#:weapon-list (list (my-weapon-3)))
