#lang starwars-battle-arena
(define (health-potion)
 (custom-item #:name     "Health Potion"
              #:sprite   (make-icon "HP" 'green 'white)
              #:on-use   (change-health-by 50)
              #:rarity   'uncommon
              #:respawn? #t))

(define (max-health-potion)
 (custom-item #:name   "Max Health Potion"
              #:sprite (make-icon "MHP" 'green 'white)
              #:on-use (set-health-to 100)
              #:rarity 'epic))

(starwars-game
#:item-list      (list (health-potion)
                       (max-health-potion)))
