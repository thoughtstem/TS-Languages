#lang racket

(require ts-kata-util
  battle-arena-avengers)

;And you probably want your lang, not racket below.
;  But technically you can make examples for any language
(define-example-code racket my-example-1
  (require 2htdp/image)

  (circle 40 'solid 'red))

;You can define as many examples as you want in this file