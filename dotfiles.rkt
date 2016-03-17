#lang racket

; requires
(require racket/file)

(provide copy-dotfiles-from-profile*)

(define alfafiles-home "alfafiles")

(define (path-to-profile profile)
  (build-path (find-system-path 'home-dir) alfafiles-home profile))

(define (source-dotfiles-location-for-profile profile)
  (build-path (path-to-profile profile) "dotfiles"))

(define (destination-dotfiles-location)
  (cond
    [(eq? (system-type) 'macosx) (find-system-path 'home-dir)]
    [(eq? (system-type) 'unix) (find-system-path 'home-dir)]
    [(eq? (system-type) 'windows) (find-system-path 'home-dir)]))
    
  
(define (copy-dotfiles-from-profile* profile)
  (cond
    [(not (directory-exists? (destination-dotfiles-location))) (error (string-append "Destination dotfiles folder missing: " (path->string (destination-dotfiles-location))))]
    [(not (directory-exists? (source-dotfiles-location-for-profile profile))) (error (string-append "Source dotfiles location for profile missing: " (path->string (source-dotfiles-location-for-profile profile))))]
    [else (display "should copy")])) 

  
 
