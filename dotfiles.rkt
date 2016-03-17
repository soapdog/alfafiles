#lang racket

; load required libs
(require racket/file)
(require "profiles.rkt")

; What this module provides
(provide copy-dotfiles-from-profile*)

; ****************
;  IMPLEMENTATION
; ****************

(define (source-dotfiles-location-for-profile profile)
  (build-path (path-to-profile profile) "dotfiles")) ; Dotfiles are located in a folder called dotfiles inside the profile folder

(define (destination-dotfiles-location)
  (cond
    [(eq? (system-type) 'macosx) (find-system-path 'home-dir)]
    [(eq? (system-type) 'unix) (find-system-path 'home-dir)]
    [(eq? (system-type) 'windows) (find-system-path 'home-dir)])) ; This is quite redundant, I know. I am just leaving it here in case I need to customize for different platforms


(define (copy-dotfiles-from-profile* profile)
  (cond
    [(not (directory-exists? (destination-dotfiles-location))) (error (string-append "Destination dotfiles folder missing: " (path->string (destination-dotfiles-location))))]
    [(not (directory-exists? (source-dotfiles-location-for-profile profile))) (error (string-append "Source dotfiles location for profile missing: " (path->string (source-dotfiles-location-for-profile profile))))]
    [else (display "should copy")])) 



