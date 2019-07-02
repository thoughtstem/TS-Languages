#lang at-exp racket

(provide
  (rename-out [plot-pict plot])
  (rename-out [plot3d-pict plot3d])
 (all-from-out "./lang/main.rkt")

 #;
 (all-from-out "./lang/corpus/main.rkt")
 (all-from-out "./assets.rkt")
 (all-from-out pict)
 (all-from-out plot/no-gui)
 (all-from-out racket)
 #%module-begin)

(require pict)
(require plot/no-gui)
(require "./lang/main.rkt")
(require "./assets.rkt")

#;
(require (except-in "./lang/corpus/main.rkt"
                    scale))


