#lang racket

(require racket/cmdline)

(require "dotfiles.rkt")

(define verbose-mode (make-parameter #f))

(define install-profile
  (command-line
   #:program "compiler"
   #:once-each
   [("-v" "--verbose") "Compile with verbose messages"
                       (verbose-mode #t)]
   #:args (profile) ; expect one command-line argument: <filename>
   ; return the argument as a filename to compile
   profile))


