#lang battle-arena-starwars
(starwars-game
#:item-list (list (custom-item #:name   "Damage Boost"
                               #:sprite (make-icon "DB" 'orangered)
                               #:on-use (change-damage-by 1000 #:for 200))))
