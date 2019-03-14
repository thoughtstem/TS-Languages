#lang racket

(require ts-kata-util battlearena)


(define-example-code battlearena hello-world-1
  (battlearena-game)
  )

; ---------------

(define-example-code battlearena force-field-1
  (battlearena-game
   #:item-list (list (custom-item #:name "Force Field"
                                  #:on-use (spawn (force-field)))))
  )

(define-example-code battlearena force-field-2
  (battlearena-game
   #:item-list (list (custom-item #:name "Force Field"
                                  #:sprite (make-icon "FF")
                                  #:on-use (spawn (force-field #:duration 1000)))))
  )

(define-example-code battlearena force-field-3
  (define (force-field-item)
    (custom-item #:name "Force Field"
                 #:sprite (make-icon "FF")
                 #:on-use (spawn (force-field #:allow-friendly-dart? #t
                                              #:duration 1000))))
 
  (battlearena-game
    #:item-list (list (force-field-item)))
  )

;-----------------

(define-example-code battlearena avatar-1
  (battlearena-game
   #:avatar (custom-avatar))
  )

(define-example-code battlearena avatar-2
  (battlearena-game
   #:avatar (custom-avatar #:sprite pirateboy-sprite))
  )

(define-example-code battlearena avatar-3
  (define (my-avatar)
    (custom-avatar #:sprite pirategirl-sprite
                   #:speed 20))
  
  (battlearena-game
   #:avatar (my-avatar))
  )

(define-example-code battlearena avatar-4
  (define (my-avatar)
    (custom-avatar #:sprite steampunkgirl-sprite
                   #:speed 20
                   #:item-slots 5))
  
  (battlearena-game
   #:avatar (my-avatar))
  )

;-----------------

(define-example-code battlearena enemy-1
  (battlearena-game
   #:enemy-list (list (custom-enemy)))
  )

(define-example-code battlearena enemy-2
  (battlearena-game
   #:enemy-list (list (curry custom-enemy #:amount-in-world 10)))
  )

(define-example-code battlearena enemy-3
  (define (my-enemy)
    (custom-enemy #:sprite          darkknight-sprite
                  #:ai              'medium
                  #:amount-in-world 5))

  (battlearena-game
   #:enemy-list (list (my-enemy)))
  )

;Tip: you can also change shield instead of health
(define-example-code battlearena enemy-4
  (define (easy-enemy)
    (custom-enemy #:ai              'easy
                  #:sprite          wizard-sprite
                  #:health          50
                  #:amount-in-world 5))
  
  (define (medium-enemy)
    (custom-enemy #:ai              'medium
                  #:sprite          darkknight-sprite
                  #:health          200
                  #:amount-in-world 5))
 
  (battlearena-game
   #:enemy-list (list (easy-enemy)
                      (medium-enemy))))

(define-example-code battlearena enemy-5
 
  (define (hard-enemy)
    (custom-enemy #:ai              'hard
                  #:sprite          pirategirl-sprite
                  #:amount-in-world 5
                  #:weapon          (custom-weapon #:damage 50)))
 
  (battlearena-game
   #:avatar       (custom-avatar)
   #:enemy-list   (list (hard-enemy))))

;-----------------

(define-example-code battlearena enemy-weapon-1
  (battlearena-game
   #:enemy-list (list (custom-enemy
                       #:weapon (sword))))
  )

(define-example-code battlearena enemy-weapon-2
  (define (my-weapon)
    (sword #:damage 40))

  (battlearena-game
   #:enemy-list (list (custom-enemy
                       #:weapon (my-weapon))))
  )

(define-example-code battlearena enemy-weapon-3
  (define (my-dart)
    (custom-dart
     #:damage 5
     #:speed  1
     #:range  200))

  (define (my-weapon)
    (custom-weapon
     #:name      "Repeator"
     #:dart      (my-dart)))

  (battlearena-game
   #:enemy-list (list (custom-enemy
                       #:weapon (my-weapon))))
  )

;-----------------

;Tip: defaults: damage = 25, durability = 20, range = 10
(define-example-code battlearena sword-1
  (battlearena-game
   #:weapon-list (list (sword)))
  )

(define-example-code battlearena sword-2
  (battlearena-game
   #:weapon-list (list (sword #:name "Heavy Sword"
                              #:damage 50)))
  )

; Tip: common = 5, uncommon = 4, rare = 3, epic = 2, legendary = 1
(define-example-code battlearena sword-3
  (define (my-sword)
    (sword #:name   "Heavy Sword"
           #:damage 50
           #:rarity 'epic))
  
  (battlearena-game
   #:weapon-list (list (my-sword))))

; Tip: try different colors like: 'red 'lightblue 'darkmagenta
(define-example-code battlearena sword-4
  (define (my-sword)
    (sword #:name   "Sword"
           #:icon   (make-icon "LS" 'gold)
           #:sprite (set-sprite-color 'gold swinging-sword-sprite)
           #:damage 100
           #:duration  100
           #:rarity 'legendary))
  
  (battlearena-game
   #:weapon-list (list (my-sword)))
  )

;-----------------

(define-example-code battlearena background-1  
  (battlearena-game
   #:bg (custom-bg))
  )

(define-example-code battlearena background-2
  (battlearena-game #:bg (custom-bg #:img LAVA-BG))
  )

(define-example-code battlearena background-3
  (define (my-bg)
    (custom-bg #:img LAVA-BG
               #:rows 2
               #:columns 2))
 
  (battlearena-game #:bg (my-bg))
  )

(define-example-code battlearena background-4
  (define (my-bg)
    (custom-bg #:img LAVA-BG
               #:rows 2
               #:columns 2
               #:start-tile 3
               #:hd? #t))
 
  (battlearena-game #:bg (my-bg))
  )

;-----------------


(define-example-code battlearena boost-1
  (battlearena-game
   #:item-list (list (custom-item #:name   "Damage Boost"
                                  #:sprite (make-icon "DB" 'orangered)
                                  #:on-use (change-damage-by 1000 #:for 200))))
  )

(define-example-code battlearena boost-2
  (battlearena-game
   #:item-list (list (custom-item #:name   "Speed Boost"
                                  #:sprite (make-icon "SB" 'yellow)
                                  #:on-use (multiply-speed-by 2 #:for 200))))
  )

(define-example-code battlearena boost-3
  (define (damage-boost)
    (custom-item #:name   "Damage Boost"
                 #:sprite (make-icon "DB" 'orangered)
                 #:on-use (change-damage-by 1000 #:for 200)
                 #:rarity 'epic))

  (define (speed-boost)
    (custom-item #:name   "Speed Boost"
                 #:sprite (make-icon "SB" 'yellow)
                 #:on-use (multiply-speed-by 2 #:for 200)
                 #:rarity 'uncommon))
  
  (battlearena-game
   #:item-list (list (damage-boost)
                     (speed-boost)))
  )

;-----------------

(define-example-code battlearena dagger-tower-1
  (battlearena-game
   #:weapon-list (list (custom-weapon
                        #:name "Dagger Tower"
                        #:sprite (make-icon "RT")
                        #:dart (dagger-tower-builder)))))

(define-example-code battlearena dagger-tower-2
  (battlearena-game
   #:weapon-list (list (custom-weapon
                        #:name "Dagger Tower"
                        #:sprite (make-icon "RT")
                        #:dart (dagger-tower-builder
                                #:speed      10
                                #:fire-mode  'spread)))))

(define-example-code battlearena dagger-tower-3
  (battlearena-game
   #:weapon-list (list (custom-weapon
                        #:name "Dagger Tower"
                        #:sprite (make-icon "RT")
                        #:dart (dagger-tower-builder
                                #:sprite     STUDENT-IMAGE-HERE
                                #:damage     1000
                                #:speed      10
                                #:fire-mode  'spread)))))

;-----------------


(define-example-code battlearena size-1
  
  (battlearena-game
   #:item-list (list (custom-item #:name   "Grow Powerup"
                                  #:sprite (make-icon "BIG" 'red 'white)
                                  #:on-use (scale-sprite 2 #:for 100)))))

(define-example-code battlearena size-2

  (battlearena-game
   #:item-list (list (custom-item #:name   "Shrink Powerup"
                                  #:sprite (make-icon "SML" 'blue 'white)
                                  #:on-use (scale-sprite 0.5 #:for 100)))))

(define-example-code battlearena size-3

  (define (grow-powerup)
    (custom-item #:name   "Grow Powerup"
                 #:sprite (make-icon "BIG" 'red 'white)
                 #:on-use (scale-sprite 2 #:for 100)
                 #:rarity 'common))

  (define (shrink-powerup)
    (custom-item #:name     "Shrink Powerup"
                 #:sprite   (make-icon "SML" 'blue 'white)
                 #:on-use   (scale-sprite 0.5 #:for 100)
                 #:rarity   'rare))
  
  (battlearena-game
   #:item-list      (list (grow-powerup)
                          (shrink-powerup))))



(define-example-code battlearena health-1
  
  (battlearena-game
   #:item-list (list (custom-item #:name   "Health Powerup"
                                  #:sprite (make-icon "HP" 'green 'white)
                                  #:on-use (change-health-by 50)))))



(define-example-code battlearena health-2
  
  (battlearena-game
   #:item-list (list (custom-item #:name   "Max Health Powerup"
                                  #:sprite (make-icon "MHP" 'green 'white)
                                  #:on-use (set-health-to 100)))))



(define-example-code battlearena health-3

  (define (health-powerup)
    (custom-item #:name     "Health Powerup"
                 #:sprite   (make-icon "HP" 'green 'white)
                 #:on-use   (change-health-by 50)
                 #:rarity   'uncommon
                 #:respawn? #t))
  
  (define (max-health-powerup)
    (custom-item #:name   "Max Health Powerup"
                 #:sprite (make-icon "MHP" 'green 'white)
                 #:on-use (set-health-to 100)
                 #:rarity 'epic))
  
  (battlearena-game
   #:item-list      (list (health-powerup)
                          (max-health-powerup))))



(define-example-code battlearena homing-repeater-1
  (battlearena-game
   #:weapon-list    (list (custom-weapon #:name "Homing Repeater"
                                         #:sprite (make-icon "HR")
                                         #:fire-mode 'homing))))



(define-example-code battlearena homing-repeater-2

  (define (my-dart)
    (custom-dart #:damage 15
                 #:speed  8
                 #:range  40))
  
  (battlearena-game
   #:weapon-list    (list (custom-weapon #:name      "Homing Repeater"
                                         #:sprite    (make-icon "HR")
                                         #:fire-mode 'homing
                                         #:dart      (my-dart)))))



(define-example-code battlearena homing-repeater-3

  (define (my-dart)
    (custom-dart #:sprite (rectangle 10 2 'solid 'pink)
                 #:damage 15
                 #:speed  8
                 #:range  40))

  (define (homing-shot)
    (custom-weapon #:name      "Homing Repeater"
                   #:sprite    (make-icon "HR")
                   #:fire-mode 'homing
                   #:dart      (my-dart)
                   #:rarity    'rare))
  
  (battlearena-game
   #:weapon-list    (list (homing-shot))))



(define-example-code battlearena lava-pit-1
  (battlearena-game
   #:weapon-list (list (custom-weapon
                        #:name "Lava Pit"
                        #:sprite (make-icon "LP")
                        #:dart (lava-builder)))))



(define-example-code battlearena lava-pit-2
  (battlearena-game
   #:weapon-list (list (custom-weapon
                        #:name "Lava Pit"
                        #:sprite (make-icon "LP" 'red)
                        #:dart (lava-builder
                                #:damage 25
                                #:size   2)))))



(define-example-code battlearena lava-pit-3
  (define (my-lava-pit)
    (custom-weapon #:name "Lava Pit"
                   #:sprite (make-icon "LP" 'red 'white)
                   #:dart (lava-builder #:damage  25
                                        #:size    1
                                        #:sprite  (square 10 'solid 'black)
                                        #:range   10)))
  (battlearena-game
   #:weapon-list (list (my-lava-pit)))
  )



(define-example-code battlearena magic-balance-1
  (battlearena-game
   #:weapon-list (list (ring-of-fire #:name "Light Magic"
                                     #:icon (make-icon "LM")
                                     #:damage 20
                                     #:rarity 'common))))


;Tip: also try ring-of-ice
(define-example-code battlearena magic-balance-2
  (battlearena-game
   #:weapon-list (list (ring-of-fire #:name "Heavy Magic"
                                     #:icon   (make-icon "HM")
                                     #:sprite (scale 2 flame-sprite)
                                     #:damage 200
                                     #:rarity 'epic))))

(define-example-code battlearena magic-balance-3
  (define (heavy-magic)
    (ring-of-fire #:name   "Heavy Magic"
                  #:icon   (make-icon "HM")
                  #:sprite (scale 2 flame-sprite)
                  #:damage 200
                  #:rarity 'epic))

  (define (light-magic)
    (ring-of-fire #:name     "Light Magic"
                  #:sprite   (make-icon "LM")
                  #:damage   20
                  #:duration 20
                  #:rarity   'common
                  ))
  
  (battlearena-game
   #:weapon-list (list (heavy-magic)
                       (light-magic)))
  )


(define-example-code battlearena melee-balance-1
  (battlearena-game
   #:weapon-list (list (sword #:name "Light Sword"
                              #:icon (make-icon "LS")
                              #:damage 10
                              #:rarity 'common))))

(define-example-code battlearena melee-balance-2
  (battlearena-game
   #:weapon-list (list (sword #:name "Heavy Sword"
                              #:icon (make-icon "HS")
                              #:sprite (scale 2 swinging-sword-sprite)
                              #:damage 200
                              #:rarity 'epic))))

(define-example-code battlearena melee-balance-3
  (define (heavy-sword)
    (sword #:name "Heavy Sword"
           #:icon (make-icon "HS")
           #:sprite (scale 2 swinging-sword-sprite)
           #:damage 200
           #:rarity 'epic))

  (define (light-sword)
    (sword #:name "Light Sword"
           #:icon (make-icon "LS")
           #:damage 10
           #:rarity 'common))
  
  (battlearena-game
   #:weapon-list (list (heavy-sword)
                       (light-sword)))
  )


(define-example-code battlearena paint-thrower-1
  
  (battlearena-game
   #:weapon-list (list (paint-thrower)))
  )

(define-example-code battlearena paint-thrower-2
  (define (my-weapon)
    (paint-thrower #:name   "Heavy Paint Thrower"
                   #:damage 20))
  
  (battlearena-game
   #:weapon-list (list (my-weapon)))
  )

(define-example-code battlearena paint-thrower-3
  (define (my-weapon)
    (paint-thrower #:name   "Paint Thrower"
                   #:icon (make-icon "PT" 'blue)
                   #:damage 20
                   #:speed  10
                   #:rarity 'epic))

  (battlearena-game
   #:weapon-list (list (my-weapon)))
  )


(define-example-code battlearena paint-thrower-4
  (define (my-weapon)
    (paint-thrower #:name   "Paint Thrower"
                   #:icon   (make-icon "PT" 'blue)
                   #:sprite (set-sprite-color 'green paint-sprite)
                   #:damage  20
                   #:speed   10
                   #:range   50
                   #:rarity  'legendary))

  (battlearena-game
   #:weapon-list (list (my-weapon)))
  )

(define-example-code battlearena fire-magic-1
  
  (battlearena-game
   #:weapon-list (list (fire-magic)))
  )

(define-example-code battlearena fire-magic-2
  (define (my-weapon)
    (fire-magic #:name   "Heavy Fire Magic"
                #:damage 20))
  
  (battlearena-game
   #:weapon-list (list (my-weapon)))
  )

(define-example-code battlearena fire-magic-3
  (define (my-weapon)
    (fire-magic #:name   "Fire Magic"
                #:icon (make-icon "FM" 'red)
                #:damage 20
                #:speed  10
                #:rarity 'epic))
  
  (battlearena-game
   #:weapon-list (list (my-weapon)))
  )

(define-example-code battlearena fire-magic-4
  (define (my-weapon)
    (fire-magic #:name   "Fire Magic"
                #:icon   (make-icon "FM" 'red)
                #:sprite (set-sprite-color 'green flame-sprite)
                #:damage  20
                #:speed   10
                #:range   50
                #:rarity  'legendary))

  (battlearena-game
   #:weapon-list (list (my-weapon)))
  )

(define-example-code battlearena ice-magic-1
  
  (battlearena-game
   #:weapon-list (list (ice-magic)))
  )

(define-example-code battlearena ice-magic-2
  (define (my-weapon)
    (ice-magic #:name   "Heavy Ice Magic"
               #:damage 20))
  
  (battlearena-game
   #:weapon-list (list (my-weapon)))
  )

(define-example-code battlearena ice-magic-3
  (define (my-weapon)
    (ice-magic #:name   "Ice Magic"
               #:icon (make-icon "FM" 'red)
               #:damage 20
               #:speed  10
               #:rarity 'epic))
  
  (battlearena-game
   #:weapon-list (list (my-weapon)))
  )

(define-example-code battlearena ice-magic-4
  (define (my-weapon)
    (ice-magic #:name   "Ice Magic"
               #:icon   (make-icon "FM" 'red)
               #:sprite (set-sprite-color 'green ice-sprite)
               #:damage  20
               #:speed   10
               #:range   50
               #:rarity  'legendary))

  (battlearena-game
   #:weapon-list (list (my-weapon)))
  )

(define-example-code battlearena repeater-armor-1
  
  (battlearena-game
   #:item-list (list (custom-armor #:name   "Repeater Armor"
                                   #:sprite (make-icon "RA"))))

  
  )




(define-example-code battlearena repeater-armor-2
  
  (battlearena-game
   #:item-list (list (custom-armor #:name          "Repeater Armor"
                                   #:sprite        (make-icon "RA")
                                   #:protects-from "Repeater"
                                   #:change-damage (divide-by 2)
                                   #:rarity        'rare
                                   )))

  
  )




(define-example-code battlearena repeater-armor-3
  
  (battlearena-game
   #:enemy-list (list (custom-enemy #:amount-in-world 10
                                    #:weapon          (custom-weapon
                                                       #:name "Repeater")))
   #:item-list (list (custom-armor #:name          "Repeater Armor"
                                   #:sprite        (make-icon "RA")
                                   #:protects-from "Repeater"
                                   #:change-damage (divide-by 2)
                                   #:rarity        'rare)))

  
  ) 



(define-example-code battlearena repeater-balance-1
  (battlearena-game
   #:weapon-list (list (custom-weapon #:name "Light Repeater"
                                      #:dart (custom-dart #:sprite paint-sprite
                                                          #:damage 20
                                                          #:durability 1
                                                          #:speed  30
                                                          #:range  50)
                                      #:rarity 'common))))

(define-example-code battlearena repeater-balance-2
  (battlearena-game
   #:weapon-list (list (custom-weapon #:name "Heavy Repeater"
                                      #:dart (custom-dart #:sprite (scale 2 paint-sprite)
                                                          #:damage 500
                                                          #:durability 100
                                                          #:speed  10
                                                          #:range  50)
                                      #:rarity 'uncommon))))

(define-example-code battlearena repeater-balance-3
  (define (heavy-dart)
    (custom-dart #:sprite (scale 2 paint-sprite)
                 #:damage 500
                 #:durability 100
                 #:speed  10
                 #:range  50))

  (define (light-dart)
    (custom-dart #:sprite paint-sprite
                 #:damage 20
                 #:durability 1
                 #:speed  30
                 #:range  50))
  
  (battlearena-game
   #:weapon-list (list (custom-weapon #:name "Heavy Repeater"
                                      #:dart (heavy-dart)
                                      #:rarity 'uncommon)
                       (custom-weapon #:name "Light Repeater"
                                      #:dart (light-dart)
                                      #:rarity 'common))))



(define-example-code battlearena repeater-tower-1
  (battlearena-game
   #:weapon-list (list (custom-weapon
                        #:name "Repeater Tower"
                        #:sprite (make-icon "RT")
                        #:dart (repeater-tower-builder)))))



(define-example-code battlearena repeater-tower-2
  (battlearena-game
   #:weapon-list (list (custom-weapon
                        #:name "Repeater Tower"
                        #:sprite (make-icon "RT")
                        #:dart (repeater-tower-builder
                                #:speed      2
                                #:fire-rate  10)))))



(define-example-code battlearena repeater-tower-3
  (battlearena-game
   #:weapon-list (list (custom-weapon
                        #:name "Repeater Tower"
                        #:sprite (make-icon "RT")
                        #:dart (repeater-tower-builder
                                #:sprite     STUDENT-IMAGE-HERE
                                #:speed      15
                                #:damage     1000
                                #:range      500
                                #:fire-rate  0.1)))))



(define-example-code battlearena rocket-tower-1
  (battlearena-game
   #:weapon-list (list (custom-weapon
                        #:name "Rocket Tower"
                        #:sprite (make-icon "RT")
                        #:dart (rocket-tower-builder)))))



(define-example-code battlearena rocket-tower-2
  (battlearena-game
   #:weapon-list (list (custom-weapon
                        #:name "Rocket Tower"
                        #:sprite (make-icon "RT")
                        #:dart (rocket-tower-builder
                                #:speed      2
                                #:fire-mode  'homing)))))



(define-example-code battlearena rocket-tower-3
  (battlearena-game
   #:weapon-list (list (custom-weapon
                        #:name "Rocket Tower"
                        #:sprite (make-icon "RT")
                        #:dart (rocket-tower-builder
                                #:sprite     STUDENT-IMAGE-HERE
                                #:range      200
                                #:damage     1000
                                #:speed      2
                                #:fire-mode  'homing)))))




(define-example-code battlearena shield-1
  (battlearena-game
   #:item-list (list (custom-item #:name     "Shield Powerup" 
                                  #:sprite   (make-icon "SP" 'blue 'white)
                                  #:on-use   (change-shield-by 50))))
  )





(define-example-code battlearena shield-2
  (battlearena-game
   #:item-list (list (custom-item #:name     "Max Shield Powerup"
                                  #:sprite   (make-icon "MSP" 'blue 'white)
                                  #:on-use   (set-shield-to 100))))
  )





(define-example-code battlearena shield-3

  (define (shield-powerup)
    (custom-item #:name     "Shield Powerup" 
                 #:sprite   (make-icon "SP" 'blue 'white)
                 #:on-use   (change-shield-by 50)
                 #:rarity   'uncommon
                 #:respawn? #t))

  (define (max-shield)
    (custom-item #:name     "Max Shield Powerup"
                 #:sprite   (make-icon "MSP" 'blue 'white)
                 #:on-use   (set-shield-to 100)
                 #:rarity   'epic))
  
  (battlearena-game
   #:item-list (list (shield-powerup)
                     (max-shield)))
  )








(define-example-code battlearena single-shot-1
  (battlearena-game
   #:weapon-list (list (custom-weapon #:name        "Single Shot"
                                      #:sprite      (make-icon "SS")
                                      #:rapid-fire? #f))))

(define-example-code battlearena single-shot-2

  (define (my-dart)
    (custom-dart #:damage 20
                 #:speed  20
                 #:range  50))
  
  (battlearena-game
   #:weapon-list (list (custom-weapon #:name      "Single Shot"
                                      #:sprite    (make-icon "SS")
                                      #:rapid-fire? #f
                                      #:dart      (my-dart)))))



(define-example-code battlearena single-shot-3

  (define (my-dart)
    (custom-dart #:sprite (rectangle 10 2 'solid 'cyan)
                 #:damage 40
                 #:speed  20
                 #:range  50))

  (define (single-shot)
    (custom-weapon #:name        "Single Shot"
                   #:sprite      (make-icon "SS")
                   #:dart        (my-dart)
                   #:rapid-fire? #f
                   #:rarity      'rare))
  
  (battlearena-game
   #:weapon-list (list (single-shot))))


;Tip: defaults: damage = 50, speed = 5, range 20
(define-example-code battlearena spear-1
  (battlearena-game
   #:weapon-list (list (spear)))
  )

(define-example-code battlearena spear-2
  (battlearena-game
   #:weapon-list (list (spear #:name "Heavy Spear"
                              #:damage 50)))
  )

; Tip: common = 5, uncommon = 4, rare = 3, epic = 2, legendary = 1
(define-example-code battlearena spear-3
  (define (my-spear)
    (spear #:name   "Heavy Spear"
           #:damage 50
           #:rarity 'epic))
  
  (battlearena-game
   #:weapon-list (list (my-spear))))

; Tip: try different colors like: 'red 'lightblue 'darkmagenta
(define-example-code battlearena spear-4
  (define (my-spear)
    (spear #:name   "Spear"
           #:icon   (make-icon "LS" 'blue)
           #:sprite (set-sprite-color 'blue spear-sprite)
           #:damage 100
           #:speed 20
           #:range 10
           #:rarity 'legendary))
  
  (battlearena-game
   #:weapon-list (list (my-spear)))
  )

(define-example-code battlearena spear-tower-1
  (battlearena-game
   #:weapon-list (list (custom-weapon
                        #:name "Spear Tower"
                        #:sprite (make-icon "ST")
                        #:dart (spear-tower-builder)))))

(define-example-code battlearena spear-tower-2
  (battlearena-game
   #:weapon-list (list (custom-weapon
                        #:name "ST"
                        #:sprite (make-icon "ST" 'tan)
                        #:dart (spear-tower-builder
                                #:speed 10 
                                #:range 50)))))

(define-example-code battlearena spear-tower-3
  (battlearena-game
   #:weapon-list (list (custom-weapon
                        #:name "Spear Tower"
                        #:sprite (make-icon "ST" 'tan 'white)
                        #:dart (spear-tower-builder
                                #:sprite (set-sprite-color 'gold spear-sprite)
                                #:damage 100
                                #:speed 10
                                #:range 50)))))

(define-example-code battlearena spike-mine-1
  (battlearena-game
   #:weapon-list (list (custom-weapon
                        #:name "Spike Mine"
                        #:sprite (make-icon "SM")
                        #:dart (spike-mine-builder)))))



(define-example-code battlearena spike-mine-2
  (battlearena-game
   #:weapon-list (list (custom-weapon
                        #:name "Spike Mine"
                        #:sprite (make-icon "SM" 'gray)
                        #:dart (spike-mine-builder
                                #:speed 10 
                                #:range 50)))))



(define-example-code battlearena spike-mine-3
  (battlearena-game
   #:weapon-list (list (custom-weapon
                        #:name "Spike Mine"
                        #:sprite (make-icon "SM" 'gray 'white)
                        #:dart (spike-mine-builder
                                #:sprite (set-sprite-color 'red spike-mine-sprite)
                                #:damage 100
                                #:speed 10
                                #:range 50)))))


(define-example-code battlearena spread-shot-1
  (battlearena-game
   #:weapon-list (list (custom-weapon #:name      "Spread Shot"
                                      #:sprite    (make-icon "SPR")
                                      #:fire-mode 'spread))))



(define-example-code battlearena spread-shot-2

  (define (my-dart)
    (custom-dart #:damage     20
                 #:durability 20
                 #:speed      15))
  
  (battlearena-game
   #:weapon-list    (list (custom-weapon #:name      "Spread Shot"
                                         #:sprite    (make-icon "SPR")
                                         #:fire-mode 'spread
                                         #:dart      (my-dart)))))



(define-example-code battlearena spread-shot-3

  (define (my-dart)
    (custom-dart #:sprite     (rectangle 10 2 'solid 'orange)
                 #:damage     20
                 #:durability 20
                 #:speed      15))

  (define (spread-shot)
    (custom-weapon #:name      "Spread Shot"
                   #:sprite    (make-icon "SPR")
                   #:fire-mode 'spread
                   #:dart      (my-dart)
                   #:rarity    'rare))
  
  (battlearena-game
   #:weapon-list    (list (spread-shot))))



(define-example-code battlearena sword-armor-1
  
  (battlearena-game
   #:item-list (list (custom-armor #:name   "Sword Armor"
                                   #:sprite (make-icon "SA"))))

  
  )

(define-example-code battlearena sword-armor-2
  
  (battlearena-game
   #:item-list (list (custom-armor #:name   "Sword Armor"
                                   #:sprite (make-icon "SA")
                                   #:protects-from "Sword"
                                   #:change-damage (subtract-by 30)
                                   #:rarity 'rare)))

  
  )

(define-example-code battlearena sword-armor-3
  
  (battlearena-game
   #:enemy-list (list (custom-enemy #:amount-in-world 10
                                    #:weapon       (sword)))
   #:item-list (list (custom-armor #:name          "Sword Armor"
                                   #:sprite        (make-icon "RA")
                                   #:protects-from "Sword"
                                   #:change-damage (divide-by 2)
                                   #:rarity        'rare)))

  
  )



(define-example-code battlearena wall-builder
  (battlearena-game
   #:enemy-list (list (custom-enemy #:amount-in-world 20))
   #:weapon-list (list (custom-weapon
                        #:dart (builder-dart #:entity
                                             (wall))))))

; ==== LEVEL DESIGN KATAS ====
(define-example-code battlearena level-design-1

  (battlearena-game
   #:bg (custom-bg #:img FOREST-BG)
   #:enable-world-objects? #t)
  
  )

(define-example-code battlearena level-design-2

  (battlearena-game
   #:bg             (custom-bg #:img FOREST-BG)
   #:other-entities (make-world-objects round-tree
                                        pine-tree
                                        #:hd? #t))
  )

(define-example-code battlearena level-design-3

  (battlearena-game
   #:bg             (custom-bg #:img PINK-BG)
   #:other-entities (make-world-objects candy-cane-tree
                                        snow-pine-tree
                                        #:hd? #t
                                        #:random-color? #t))
  
  )

(define-example-code battlearena level-design-4
  
  (battlearena-game
   #:other-entities (pine-tree   (posn 100 200) #:tile 0)
                    (wood-house  (posn 100 200) #:tile 1 #:size 0.5)
                    (brick-house (posn 100 200) #:tile 2 #:hue (random 360)))
  
  )


(test-all-examples-as-games 'battlearena)



