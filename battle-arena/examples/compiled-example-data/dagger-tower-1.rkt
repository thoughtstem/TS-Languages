#lang battle-arena
(battle-arena-game
#:weapon-list (list (custom-weapon
                     #:name "Dagger Tower"
                     #:sprite (make-icon "RT")
                     #:dart (dagger-tower-builder))))