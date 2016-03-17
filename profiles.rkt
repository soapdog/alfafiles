#lang racket

(provide alfafiles-home)
(provide path-to-profile)

(define alfafiles-home "alfafiles") ; home of alfafa profiles

(define (path-to-profile profile)
  (build-path (find-system-path 'home-dir) alfafiles-home profile)) ; A profile path looks like #<path:/Users/soapdog/alfafiles/nodejs-dev>