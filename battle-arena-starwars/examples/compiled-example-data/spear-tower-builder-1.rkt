#lang battle-arena-starwars
(starwars-game
#:enemy-list (list (custom-enemy #:amount-in-world 20))
#:weapon-list (list (custom-weapon
                     #:dart (spear-tower-builder))))
