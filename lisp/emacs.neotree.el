;; Makes a vim nerdtree like split in the window that shows the directory heirarchy

(use-package neotree
  :ensure t
  :commands (
    neotree
    neotree-show
    neotree-hide
    neotree-toggle
    neotree-refresh
    netoree-quick-look
    neotree-hidden-file-toggle
   )
  :init
    ;; Show hidden files, default=nil
    (setq neo-show-hidden-files t)
    ;; Show neotree automatically on emacs start-up
    (neotree-show)
  :config
    ;; If theme not set, set it to "nerd" for graphics displays and "arrow" for terminal displays
    ;; Options are: classic (default), ascii, arrow, icons, or nerd.  Icon requires special
    ;;  all-the-icons package that needs manual font installation as well.
    (if (not neo-theme) (setq neo-theme 'nerd))

    ;; Neotree updates the root dir to the new projectile project immediately
    (setq projectile-switch-project-action 'neotree-projectile-action)

    ;; Immediately try to set the projectile root when we load if we're in a projectile project
    (if (projectile-project-p)
        (neotree-projectile-action))

    ;; Automatically follow the current file in the neotree buffer
    (setq neo-autorefresh t)

    ;; Either: left(default) or right
    (setq neo-window-position 'left)

    ;; Message to show in the banner, default=nil
    ;(setq neo-banner-message nil)

    ;; Show the ".. (up a dir)" line at the top? Default=t
    (setq neo-show-updir-line t)

    ;;Options: default, neotree, custom, none
    ;; default=nothing on line
    ;; neotree= number of nodes and parent directory of highlighted
    ;;custom= setup in neo-mode-line-custom-format
    ;; none=hides mode line
    (setq neo-mode-line-type 'neotree)

    ;;Jumps to current node every time neo-tree is opened (like autorefresh,
    ;; but for when tree is usually hidden)
    (setq neo-smart-open t)

    ;; Width of window, default=25
    ;(setq neo-window-width 25)

    ;; Doesn't change size when windows are rebalanced, default=t
    (setq neo-window-fixed-size t)

    ;; Integrate with VC by changing faces for states of files? Default=nil
    (setq neo-vc-integration nil)

    ;; Confirm changing root if file not found in current one: `yes-or-no-p',
    ;; `y-or-n-p', `off-p'
    (setq neo-confirm-change-root 'y-or-n-p)

    ;; Confirmation inputs: `yes-or-no-p', `y-or-n-p', `off-p'
    (setq neo-confirm-create-file 'yes-or-no-p)
    (setq neo-confirm-create-directory 'yes-or-no-p)
    (setq neo-confirm-delete-file 'yes-or-no-p)
    (setq neo-confirm-delete-directory-recursively 'yes-or-no-p)
    (setq neo-confirm-kill-buffers-for-files-in-directory 'yes-or-no-p)

    ;; Change root without prompting?
    ;; If this is set to prompt, it goes crazy with ivy since the buffers it creates don't
    ;; correspond to a file neotree can find and it will constantly keep prompting
    (setq neo-force-change-root t)
    :bind (
           ;; main entry key
           ([f7] . neotree-toggle)
     )
  )

(provide 'emacs.neotree)
