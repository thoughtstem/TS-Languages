#lang battle-arena
(battle-arena-game
#:weapon-list (list (custom-weapon
                     #:name "Spear Tower"
                     #:sprite (make-icon "ST" 'tan 'white)
                     #:dart (spear-tower-builder
                             #:sprite STUDENT-IMAGE-HERE
                             #:damage 100
                             #:speed 10
                             #:range 50))))