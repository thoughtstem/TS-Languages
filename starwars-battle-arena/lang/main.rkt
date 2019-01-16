#lang at-exp racket

(require scribble/srcdoc)
(require (for-doc racket/base scribble/manual ))

(require ts-kata-util 2htdp/image 
         "../assets.rkt"
         battle-arena)


(define/contract/doc (custom-jedi #:sprite (sprite (sheet->sprite twileck-jedi)))
  (->i () (#:sprite [sprite sprite?]) (result entity?))
  @{This returns an avatar.}
  (custom-avatar #:sprite sprite))

(define/contract/doc (starwars-game #:avatar (avatar (custom-jedi)))
  (->i () (#:avatar [avatar entity?]) (result game?))
  @{This starts a game.}
  (battle-arena-game #:avatar avatar))
