; enable dumb-jump-mode
(use-package dumb-jump
  init:
  (setq dumb-jump-prefer-searcher 'ag)  
  (dumb-jump-mode 1))

