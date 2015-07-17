;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; better-defaults
     (auto-completion :variables
                      auto-completion-return-key-behaviour 'complete
                      auto-completion-tab-key-behaviour 'cycle
                      auto-completion-complete-with-key-sequence nil)
     rust
     haskell
     scala
     ruby
     git
     html
     sass
     scss
     css
     scheme
     racket
     (clojure :variables clojure-enable-fancify-symbols t)
     emacs-lisp
     (git :variables
          git-gutter-use-fringe t)
     markdown
     ;; org
     shell
     org
     ;; syntax-checking
     )
   ;; List of additional packages that will be installed wihout being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t

   ;; Clojure fix
   evil-move-beyond-eol t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(gruvbox
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f) is replaced.
   dotspacemacs-use-ido nil
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state nil
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode t
   ;; Select a scope to highlight delimiters. Possible value is `all',
   ;; `current' or `nil'. Default is `all'
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
  )

(defun remap-evil-lisp-mode-keys ()
  ;; (evil-define-key 'normal evil-paredit-mode-map
  ;;   (kbd "j") 'evil-paredit-delete
  ;;   (kbd "d") 'evil-backward-char
  ;;   (kbd "c") 'evil-paredit-change
  ;;   (kbd "y") 'evil-paredit-yank
  ;;   (kbd "D") 'evil-paredit-delete-line
  ;;   (kbd "C") 'evil-paredit-change-line
  ;;   (kbd "S") 'evil-paredit-change-whole-line
  ;;   (kbd "S") 'evil-paredit-change-whole-line
  ;;   (kbd "S") 'evil-paredit-change-whole-line
  ;;   (kbd "Y") 'evil-paredit-yank-line
  ;;   (kbd "X") 'paredit-backward-delete
  ;;   (kbd "x") 'paredit-forward-delete)

  (define-key evil-lisp-state-map "d" 'evil-backward-char)
  (define-key evil-lisp-state-map "h" 'evil-next-visual-line)
  (define-key evil-lisp-state-map "t" 'evil-previous-visual-line)
  (define-key evil-lisp-state-map "n" 'evil-forward-char)

  (define-key evil-lisp-state-map "j" nil)
  (define-key evil-lisp-state-map "J" nil)

  (defconst evil-lisp-customizations
    '(("js" . sp-kill-symbol)
      ("Js" . sp-backward-kill-symbol)
      ("jw" . sp-kill-word)
      ("Jw" . sp-backward-kill-word)
      ("jx" . sp-kill-sexp)
      ("Jx" . sp-backward-kill-sexp)

      ("k" . sp-transpose-sexp)

      ("d" . sp-backward-symbol)
      ("D" . sp-backward-sexp)
      ("h" . lisp-state-next-closing-paren)
      ("H" . sp-join-sexp)
      ("t" . lisp-state-prev-opening-paren)
      ("T" . lisp-state-forward-symbol)
      ("n" . lisp-state-forward-symbol)
      ("N" . sp-forward-sexp)))

  (eval-after-load 'evil-lisp-state
    (dolist (x evil-lisp-customizations)
      (let ((key (car x))
            (cmd (cdr x)))
        (eval
         `(progn
            (define-key evil-lisp-state-map ,(kbd key) ',cmd)
            ;; (if evil-lisp-state-global
            ;;     (evil-leader/set-key
            ;;       ,(kbd (concat evil-lisp-state-leader-prefix " " key))
            ;;       (evil-lisp-state-enter-command ,cmd))
            ;;   (dolist (mm evil-lisp-state-major-modes)
            ;;     (evil-leader/set-key-for-mode mm
            ;;       ,(kbd (concat evil-lisp-state-leader-prefix " " key))
            ;;       (evil-lisp-state-enter-command ,cmd))))
            ))))))

(defun remap-helm-keys ()
  (with-eval-after-load 'helm
    (define-key helm-map (kbd "C-h") 'helm-next-line)
    (define-key helm-map (kbd "C-t") 'helm-previous-line)
    (define-key helm-map (kbd "C-n") 'helm-next-source)
    (define-key helm-map (kbd "C-d") 'helm-previous-source)
    (define-key helm-find-files-map (kbd "C-h") 'helm-next-line)
    (define-key helm-find-files-map (kbd "C-t") 'helm-previous-line))
  (with-eval-after-load 'helm-projectile-find-file-map
    (define-key helm-projectile-find-file-map (kbd "C-h") 'helm-next-line)
    (define-key helm-projectile-find-file-map (kbd "C-t") 'helm-previous-line)))

(defun remap-dired-keys ()
  (eval-after-load 'dired
    '(progn
       ;; use the standard Dired bindings as a base
       (evil-make-overriding-map dired-mode-map 'normal t)
       (evil-define-key 'normal dired-mode-map
         "d" 'evil-backward-char
         "h" 'evil-next-line
         "t" 'evil-previous-line
         "n" 'evil-forward-char
         "H" 'dired-goto-file
         "T" 'dired-do-kill-lines
         "r" 'dired-do-redisplay))))

(defun remap-auto-completion-keys ()
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "C-d") 'company-show-doc-buffer)
    (define-key company-active-map (kbd "C-h") 'company-select-next)
    (define-key company-active-map (kbd "C-t") 'company-select-previous)
    (define-key company-active-map (kbd "C-l") 'company-complete-selection)))

(defun add-paredit-hooks ()
  (add-hook 'clojure-mode-hook    (lambda () (paredit-mode 1)))
  (add-hook 'cider-repl-mode-hook (lambda () (paredit-mode 1)))
  (add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode 1))))

(defun add-clojure-hooks ()
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'company-mode))

(defun remap-evil-for-dvp ()
  ;; DVP
  (define-key evil-normal-state-map "d" 'evil-backward-char)
  (define-key evil-normal-state-map "D" 'evil-delete-line)
  (define-key evil-normal-state-map "h" 'evil-next-line)
  (define-key evil-normal-state-map "t" 'evil-previous-line)
  (define-key evil-normal-state-map "n" 'evil-forward-char)

  (define-key evil-normal-state-map (kbd "<right>") 'evil-window-increase-width)
  (define-key evil-normal-state-map (kbd "<left>") 'evil-window-decrease-width)
  (define-key evil-normal-state-map (kbd "<down>") 'evil-window-increase-height)
  (define-key evil-normal-state-map (kbd "<up>")   'evil-window-decrease-height)

  (define-key evil-motion-state-map "d" 'evil-backward-char)
  (define-key evil-motion-state-map "h" 'evil-next-line)
  (define-key evil-motion-state-map "t" 'evil-previous-line)
  (define-key evil-motion-state-map "n" 'evil-forward-char)

  (define-key evil-motion-state-map "k" 'evil-find-char-to)
  (define-key evil-motion-state-map "K" 'evil-find-char-to-backward)

  (define-key evil-window-map "d" 'evil-window-left)
  (define-key evil-window-map "D" 'evil-window-move-far-left)
  (define-key evil-window-map "h" 'evil-window-down)
  (define-key evil-window-map "H" 'evil-window-move-very-bottom)
  (define-key evil-window-map "t" 'evil-window-up)
  (define-key evil-window-map "T" 'evil-window-move-very-top)
  (define-key evil-window-map "n" 'evil-window-right)
  (define-key evil-window-map "N" 'evil-window-move-far-right)

  (define-key evil-normal-state-map "j" 'evil-delete)
  (define-key evil-motion-state-map "j" 'evil-delete)

  (define-key evil-motion-state-map "l" 'evil-search-next)
  (define-key evil-motion-state-map "L" 'evil-search-previous)

  (define-key evil-normal-state-map (kbd "C-t") nil))

(defun remap-org-mode-keys ()

  (evil-define-key 'normal evil-org-mode-map
    "d" 'evil-backward-char
    "h" 'evil-next-line
    "t" 'evil-previous-line
    "n" 'evil-forward-char)

  ;; normal state shortcuts
  (evil-define-key 'normal evil-org-mode-map
    "gd" 'outline-up-heading
    "gh" (if (fboundp 'org-forward-same-level) ;to be backward compatible with older org version
             'org-forward-same-level
           'org-forward-heading-same-level)
    "gt" (if (fboundp 'org-backward-same-level)
             'org-backward-same-level
           'org-backward-heading-same-level)
    "gn" 'outline-next-visible-heading
    "k" 'org-todo
    "K" '(lambda () (interactive) (evil-org-eol-call (lambda() (org-insert-todo-heading nil))))
    "D" 'org-beginning-of-line
    "N" 'org-end-of-line
    "-" 'org-end-of-line
    "_" 'org-beginning-of-line
    "+" 'org-cycle-list-bullet
    (kbd "TAB") 'org-cycle)

  ;; normal & insert state shortcuts.
  (mapc (lambda (state)
          (evil-define-key state evil-org-mode-map
            (kbd "M-n") 'org-metaright
            (kbd "M-d") 'org-metaleft
            (kbd "M-t") 'org-metaup
            (kbd "M-h") 'org-metadown
            (kbd "M-N") 'org-shiftmetaright
            (kbd "M-D") 'org-shiftmetaleft
            (kbd "M-T") 'org-shiftmetaup
            (kbd "M-H") 'org-shiftmetadown
            (kbd "M-k") '(lambda () (interactive)
                           (evil-org-eol-call
                            '(lambda()
                               (org-insert-todo-heading nil)
                               (org-metaright))))))
        '(normal insert)))

(defun add-vim-like-paredit-bindings ()
  (evil-leader/set-key ">" 'paredit-forward-slurp-sexp)
  (evil-leader/set-key "<" 'paredit-forward-barf-sexp))

(defun setup-C-c-key ()
  ;; C-c as general purpose escape key sequence.
  (defun my-esc (prompt)
  "Functionality for escaping generally.  Includes exiting Evil insert state and C-g binding. "
    (cond
    ;; If we're in one of the Evil states that defines [escape] key, return [escape] so as
    ;; Key Lookup will use it.
     ((or (evil-insert-state-p)
          (evil-normal-state-p)
          (evil-replace-state-p)
          (evil-visual-state-p)
          (evil-lisp-state-p)) [escape])
    ;; This is the best way I could infer for now to have C-c work during evil-read-key.
    ;; Note: As long as I return [escape] in normal-state, I don't need this.
    ;;((eq overriding-terminal-local-map evil-read-key-map) (keyboard-quit) (kbd ""))
    (t (kbd "C-g"))))

  (define-key key-translation-map (kbd "C-c") 'my-esc)
  ;; Works around the fact that Evil uses read-event directly when in operator state, which
  ;; doesn't use the key-translation-map.
  (define-key evil-operator-state-map (kbd "C-c") 'keyboard-quit)

  ;; Not sure what behavior this changes, but might as well set it, seeing the Elisp manual's
  ;; documentation of it.
  ;;(set-quit-char (kbd "C-c"))
  )

(defun dotspacemacs/config ()
  "Configuration function.
  This function is called at the very end of Spacemacs initialization after
  layers configuration."

  (global-linum-mode)

  (add-paredit-hooks)
  (add-clojure-hooks)

  (remap-dired-keys)
  (remap-helm-keys)
  (remap-evil-lisp-mode-keys)
  (remap-evil-for-dvp)
  (remap-auto-completion-keys)
  (remap-org-mode-keys)

  (add-vim-like-paredit-bindings)

  (setup-C-c-key)

  (evil-leader/set-key ";" 'helm-M-x)
  (define-key evil-motion-state-map ";" 'evil-ex)
  (define-key evil-motion-state-map "_" 'evil-first-non-blank)
  (define-key evil-motion-state-map "-" 'evil-end-of-line)

  (define-key evil-window-map "-" 'split-window-vertically)
  (define-key evil-window-map "\\" 'split-window-horizontally)

  (setq inferior-lisp-program "lein figwheel")
  (evil-leader/set-key (kbd "ed") 'lisp-eval-defun)
  (evil-leader/set-key (kbd "er") 'lisp-eval-region)

  ;; (spacemacs/toggle-truncate-lines)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
