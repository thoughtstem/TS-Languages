#lang battle-arena-starwars
(starwars-game
#:weapon-list (list (custom-weapon #:name "Light Magic"
                                   #:dart (custom-dart #:sprite flame-sprite
                                                       #:damage 20
                                                       #:durability 50
                                                       #:speed  10
                                                       #:range  20
                                                       #:components
                                                       (move-in-ring))
                                   #:rarity 'common)))
