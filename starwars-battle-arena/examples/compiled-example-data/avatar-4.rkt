#lang starwars-battle-arena
(define (my-avatar)
 (custom-jedi #:sprite (sheet->sprite STUDENT-IMAGE-HERE
                                        #:columns 4)))

(starwars-game
#:avatar (my-avatar))
