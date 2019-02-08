#lang at-exp racket

#;(require scribble/srcdoc
         scribble/extract)

;(require (for-doc racket/base scribble/manual))

;(provide-extracted "./lang/main.rkt")

(module reader syntax/module-reader
   survival-minecraft)

(provide (all-from-out "./lang.rkt"))
(provide (all-from-out "./assets.rkt"))

(require "./lang.rkt")
(require "./assets.rkt")