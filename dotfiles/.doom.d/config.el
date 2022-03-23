;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Zohar Cochavi"
      user-mail-address "cochavi.zohar@protonmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size
(setq doom-font (font-spec :family "Fira Code" :size 13)
      doom-big-font (font-spec :family "Fira Mono" :size 24))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-xcode)


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/.org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; ---- PROJECTILE ----

(setq projectile-project-search-path '(("~/Documents/Projects") ("~/Documents/Study/" . 4)))

;; ---- UTILS ----

(defun try-init-python-venv ()
  "Enables python venv if project root contains .venv folder/file"
  (let ((venvdir (concat (projectile-acquire-root) ".venv")))
    (if (file-directory-p venvdir)
        (init-python-venv venvdir))))

(defun init-python-venv (venvdir)
  "Initializes python venv directory"
        (setq pyvenv-mode 1)
        (pyvenv-activate venvdir)
        (print (concat "Activated python (pyvenv and pipvenv) venv in: " venvdir)))

(defun magit-push-implicitly-wrapper()
  "Pushes to the default remote (origin)"
  (magit-push-to-remote nil nil))

;; ---- ORG ----

(after! org
  ;; Pwetty symbols
  (after! org-superstar
    (setq org-superstar-headline-bullets-list '("◉" "○" "✸" "✿" "✤" "✜" "◆" "▶")
          org-superstar-prettify-item-bullets t ))

  (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.1))
  ;; Collapsed icons
  (setq org-ellipsis " ▾ "
        org-hide-leading-stars t
        org-priority-highest ?A
        org-priority-lowest ?E
        org-priority-faces
        '((?A . 'all-the-icons-red)
          (?B . 'all-the-icons-orange)
          (?C . 'all-the-icons-yellow)
          (?D . 'all-the-icons-green)
          (?E . 'all-the-icons-blue)))
  ;; Extra ligatures
;;   (appendq! +ligatures-extra-symbols
;;             `(:checkbox      "☐"
;;               :pending       "◼"
;;               :checkedbox    "☑"
;;               :list_property "∷"
;;               :em_dash       "—"
;;               :ellipses      "…"
;;               :arrow_right   "→"
;;               :arrow_left    "←"
;;               :title         "𝙏"
;;               :subtitle      "𝙩"
;;               :author        "𝘼"
;;               :date          "𝘿"
;;               :property      "☸"
;;               :options       "⌥"
;;               :startup       "⏻"
;;               :macro         "𝓜"
;;               :html_head     "🅷"
;;               :html          "🅗"
;;               :latex_class   "🄻"
;;               :latex_header  "🅻"
;;               :beamer_header "🅑"
;;               :latex         "🅛"
;;               :attr_latex    "🄛"
;;               :attr_html     "🄗"
;;               :attr_org      "⒪"
;;               :begin_quote   "❝"
;;               :end_quote     "❞"
;;               :caption       "☰"
;;               :header        "›"
;;               :results       "🠶"
;;               :begin_export  "⏩"
;;               :end_export    "⏪"
;;               :properties    "⚙"
;;               :end           "∎"
;;               :priority_a   ,(propertize "⚑" 'face 'all-the-icons-red)
;;               :priority_b   ,(propertize "⬆" 'face 'all-the-icons-orange)
;;               :priority_c   ,(propertize "■" 'face 'all-the-icons-yellow)
;;               :priority_d   ,(propertize "⬇" 'face 'all-the-icons-green)
;;               :priority_e   ,(propertize "❓" 'face 'all-the-icons-blue)))

  ;; Extra extra ligatures
;  (set-ligatures! 'org-mode
;    :merge t
;    :checkbox      "[ ]"
;    :pending       "[-]"
;    :checkedbox    "[X]"
;    :list_property "::"
;    :em_dash       "---"
;    :ellipsis      "..."
;    :arrow_right   "->"
;    :arrow_left    "<-"
;    :title         "#+title:"
;    :subtitle      "#+subtitle:"
;    :author        "#+author:"
;    :date          "#+date:"
;    :property      "#+property:"
;    :options       "#+options:"
;    :startup       "#+startup:"
;    :macro         "#+macro:"
;    :html_head     "#+html_head:"
;    :html          "#+html:"
;    :latex_class   "#+latex_class:"
;    :latex_header  "#+latex_header:"
;    :beamer_header "#+beamer_header:"
;    :latex         "#+latex:"
;    :attr_latex    "#+attr_latex:"
;    :attr_html     "#+attr_html:"
;    :attr_org      "#+attr_org:"
;    :begin_quote   "#+begin_quote"
;    :end_quote     "#+end_quote"
;    :caption       "#+caption:"
;    :header        "#+header:"
;    :begin_export  "#+begin_export"
;    :end_export    "#+end_export"
;    :results       "#+RESULTS:"
;    :property      ":PROPERTIES:"
;    :end           ":END:"
;    :priority_a    "[#A]"
;    :priority_b    "[#B]"
;    :priority_c    "[#C]"
;    :priority_d    "[#D]"
;    :priority_e    "[#E]")
;
;  (plist-put +ligatures-extra-symbols :name "⁍")
)

  ;; LaTeX syntax highlighing
  (setq org-highlight-latex-and-related '(native script entities))
  (require 'org-src)
  (add-to-list 'org-src-block-faces '("latex" (:inherit default :extend t)))

  ;; Better LaTeX previews
  (use-package! org-fragtog
    :hook (org-mode . org-fragtog-mode))

;; helm-bibtex related stuff
(after! helm
  (use-package! helm-bibtex
    :custom
    ;; In the lines below I point helm-bibtex to my default library file.
    (bibtex-completion-bibliography '("~/Documents/.references/refs.bib"))
    (reftex-default-bibliography '("~/Documents/.references/refs.bib"))
    ;; The line below tells helm-bibtex to find the path to the pdf
    ;; in the "file" field in the .bib file.
    (bibtex-completion-pdf-field "file")
    :hook (Tex . (lambda () (define-key Tex-mode-map "\C-ch" 'helm-bibtex))))
  ;; I also like to be able to view my library from anywhere in emacs, for example if I want to read a paper.
  ;; I added the keybind below for that.
  (map! :leader
        :desc "Open literature database"
        "o l" #'helm-bibtex)
  ;; And I added the keybinds below to make the helm-menu behave a bit like the other menus in emacs behave with evil-mode.
  ;; Basically, the keybinds below make sure I can scroll through my list of references with C-j and C-k.
  (map! :map helm-map
        "C-j" #'helm-next-line
        "C-k" #'helm-previous-line)
)

;; Set up org-ref stuff
(use-package! org-ref
    :custom
    ;; Again, we can set the default library
    (org-ref-default-bibliography "~/Documents/.references/refs.bib")
    ;; The default citation type of org-ref is cite:, but I use citep: much more often
    ;; I therefore changed the default type to the latter.
    (org-ref-default-citation-link "citep")
 ;; The function below allows me to consult the pdf of the citation I currently have my cursor on.
 (defun my/org-ref-open-pdf-at-point ()
  "Open the pdf for bibtex key under point if it exists."
  (interactive)
  (let* ((results (org-ref-get-bibtex-key-and-file))
         (key (car results))
         (pdf-file (funcall org-ref-get-pdf-filename-function key)))
    (if (file-exists-p pdf-file)
        (find-file pdf-file)
      (message "No PDF found for %s" key))))
)
  (setq org-ref-completion-library 'org-ref-ivy-cite
        org-export-latex-format-toc-function 'org-export-latex-no-toc
        org-ref-get-pdf-filename-function
        (lambda (key) (car (bibtex-completion-find-pdf key)))
        ;; See the function I defined above.
        org-ref-open-pdf-function 'my/org-ref-open-pdf-at-point
        ;; For pdf export engines.
        org-latex-pdf-process (list "latexmk -pdflatex='%latex -shell-escape -interaction nonstopmode' -pdf -bibtex -f -output-directory=%o %f")
        ;; I use orb to link org-ref, helm-bibtex and org-noter together (see below for more on org-noter and orb).
        org-ref-notes-function 'orb-edit-notes)

(after! ox-latex
  (add-to-list 'org-latex-classes
               '("apa6"
                 "\\documentclass{apa6}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(setq openwith-associations '(
  ("\\.pdf\\'" "evince" (file))))

;; ---- DART ----

(add-hook 'dart-mode-hook 'lsp)

(setq company-idle-delay 0.2
  company-minimum-prefix-length 2)

(setq lsp-dart-flutter-widget-guides t)
(setq lsp-dart-dap-flutter-hot-restart-on-save t)
(setq lsp-dart-line-length 80)
(setq lsp-dart-closing-labels t)
(setq lsp-dart-closing-labels-prefix "⇝")
(setq lsp-dart-flutter-fringe-colors t)
(setq treemacs-indent-guide-mode t)
(setq lsp-dart-sdk-dir "/home/zohar/snap/flutter/common/flutter/bin/cache/dart-sdk")
(setq lsp-dart-flutter-sdk-dir "/home/zohar/snap/flutter/common/flutter/")

;; ---- JAVA ----

(after! meghanada)
(setq meghanada-java-path "/usr/lib/jvm/java-11-openjdk/bin/java")
(setq meghanada-maven-path "mvn")

;; ---- DEVENV ----

(require 'lsp-docker)

(defvar lsp-docker-client-packages
    '(lsp-css lsp-clients lsp-bash lsp-go lsp-pyls lsp-html lsp-typescript
      lsp-terraform lsp-clangd))

(setq lsp-docker-client-configs
    '((:server-id bash-ls :docker-server-id bashls-docker :server-command "bash-language-server start")
      (:server-id clangd :docker-server-id clangd-docker :server-command "clangd")
      (:server-id css-ls :docker-server-id cssls-docker :server-command "css-languageserver --stdio")
      ;; (:server-id dockerfile-ls :docker-server-id dockerfilels-docker :server-command "docker-langserver --stdio")
      (:server-id gopls :docker-server-id gopls-docker :server-command "gopls")
      (:server-id html-ls :docker-server-id htmls-docker :server-command "html-languageserver --stdio")
      (:server-id pyls :docker-server-id pyls-docker :server-command "pyls")
      ;; (:server-id ts-ls :docker-server-id tsls-docker :server-command "typescript-language-server --stdio")
      ))

(require 'lsp-docker)
(lsp-docker-init-clients
  :path-mappings '(("path-to-projects-you-want-to-use" . "/projects"))
  :client-packages lsp-docker-client-packages
  :client-configs lsp-docker-client-configs)

;; ---- LIGATURES ----

;; (use-package fira-code-mode
  ;; :config (global-fira-code-mode))

;; ---- PROJECTILE ----

(after! projectile
  (setq projectile-sort-order 'recentf)
  (setq projectile-indexing-method 'alien))


;; ---- PYTHON ----
;; source: https://github.com/hlissner/doom-emacs/issues/6028
(use-package! python-mode
  :ensure t
  :hook (python-mode . lsp-deferred)
  :config
;  (set-ligatures! 'python-mode
;    ;; Functional
;    :def "def"
;    :lambda "lambda"
;    ;; Types
;    :null "None"
;    :true "True" :false "False"
;    :int "int" :str "str"
;    :float "float"
;    :bool "bool"
;    :tuple "tuple"
;    ;; Flow
;    :not "not"
;    :in "in" :not-in "not in"
;    :and "and" :or "or"
;    :for "for"
;    :return "return" :yield "yield")

  (setq python-indent-guess-indent-offset-verbose nil)

  ;; Default to Python 3. Prefer the versioned Python binaries since some
  ;; systems stupidly make the unversioned one point at Python 2.
  (when (and (executable-find "python3")
             (string= python-shell-interpreter "python"))
    (setq python-shell-interpreter "python3"))

  (add-hook! 'python-mode-hook
    (defun +python-use-correct-flycheck-executables-h ()
      "Use the correct Python executables for Flycheck."
      (let ((executable python-shell-interpreter))
        (save-excursion
          (goto-char (point-min))
          (save-match-data
            (when (or (looking-at "#!/usr/bin/env \\(python[^ \n]+\\)")
                      (looking-at "#!\\([^ \n]+/python[^ \n]+\\)"))
              (setq executable (substring-no-properties (match-string 1))))))
        ;; Try to compile using the appropriate version of Python for
        ;; the file.
        (setq-local flycheck-python-pycompile-executable executable)
        ;; We might be running inside a virtualenv, in which case the
        ;; modules won't be available. But calling the executables
        ;; directly will work.
        (setq-local flycheck-python-pylint-executable "pylint")
        (setq-local flycheck-python-flake8-executable "flake8"))))

  (define-key python-mode-map (kbd "DEL") nil) ; interferes with smartparens
  (sp-local-pair 'python-mode "'" nil
                 :unless '(sp-point-before-word-p
                           sp-point-after-word-p
                           sp-point-before-same-p))

  (setq-hook! 'python-mode-hook tab-width python-indent-offset))
;; Set Path To pylsp and pyls otherwise it doesn't work
(setq lsp-pyls-server-command "/home/ybenel/.local/bin/pyls")
(setq lsp-pylsp-server-command "/home/ybenel/.local/bin/pylsp")
;; Set Flake8 Ignore Codes
(setq lsp-pylsp-plugins-flake8-ignore ["E231","226"])


;; ---- DAP ----
(map! :map dap-mode-map
      :leader
      :prefix ("d" . "dap")
      ;; basics
      :desc "dap next"          "n" #'dap-next
      :desc "dap step in"       "i" #'dap-step-in
      :desc "dap step out"      "o" #'dap-step-out
      :desc "dap continue"      "c" #'dap-continue
      :desc "dap hydra"         "h" #'dap-hydra
      :desc "dap debug restart" "r" #'dap-debug-restart
      :desc "dap debug"         "s" #'dap-debug

      ;; debug
      :prefix ("dd" . "Debug")
      :desc "dap debug recent"  "r" #'dap-debug-recent
      :desc "dap debug last"    "l" #'dap-debug-last

      ;; eval
      :prefix ("de" . "Eval")
      :desc "eval"                "e" #'dap-eval
      :desc "eval region"         "r" #'dap-eval-region
      :desc "eval thing at point" "s" #'dap-eval-thing-at-point
      :desc "add expression"      "a" #'dap-ui-expressions-add
      :desc "remove expression"   "d" #'dap-ui-expressions-remove

      :prefix ("db" . "Breakpoint")
      :desc "dap breakpoint toggle"      "b" #'dap-breakpoint-toggle
      :desc "dap breakpoint condition"   "c" #'dap-breakpoint-condition
      :desc "dap breakpoint hit count"   "h" #'dap-breakpoint-hit-condition
      :desc "dap breakpoint log message" "l" #'dap-breakpoint-log-message)

(after! dap-mode
  (setq dap-python-debugger 'debugpy))

;; ---- HOOKS ----
(add-hook! 'kill-emacs-hook
           #'magit-push-implicitly-wrapper)

(add-hook! 'python-mode-hook
           #'try-init-python-venv)

(add-hook! 'markdown-mode-hook
           #'turn-on-auto-fill)

(add-hook! 'emacs-startup-hook
           #'keychain-refresh-environment)


;; ---- SPLASH SCREEN ----

(defun doom-dashboard-draw-ascii-emacs-banner-fn ()
  (let* ((banner
          '("(╯°□°）╯︵ ┻━┻"))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat
                 line (make-string (max 0 (- longest-line (length line)))
                                   32)))
               "\n"))
     'face 'doom-dashboard-banner)))

(setq +doom-dashboard-ascii-banner-fn #'doom-dashboard-draw-ascii-emacs-banner-fn)

(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
(add-hook! '+doom-dashboard-mode-hook (hide-mode-line-mode 1) (hl-line-mode -1))
(setq-hook! '+doom-dashboard-mode-hook evil-normal-state-cursor (list nil))
