#lang racket

(require racket/cmdline)

(require "dotfiles.rkt")

(define verbose-mode (make-parameter #f))

(define install-profile
  (command-line
   #:program "alfafiles"
   #:once-each
   [("-v" "--verbose") "Execute with verbose messages"
                       (verbose-mode #t)]
   #:args (profile) ; expect one command-line argument: <filename>
   ; return the argument as a filename to compile
   profile))


