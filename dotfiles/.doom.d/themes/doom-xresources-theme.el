;;; doom-xresources-theme.el --- the classic Doom One theme using your .Xresources -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Copyright (C) 2022-2022 Zohar Cochavi
;;
;; Author: Zohar Cochavi <cochaviz@bunkernet.dev>
;; Maintainer: Zohar Cochavi <cochaviz@bunkernet.dev>
;; Created: 7 June, 2022
;;
;;; Commentary:
;;
;; Uses the same colors as Doom One, but takes the exact values from your .Xresources.
;;
;;; Code:

(require 'doom-themes)


(defun xresources-theme-color (name)
  "Read the color NAME (e.g. color5) from the X resources. Credits: martenlienen."
  (x-get-resource name ""))

;;
;;; Variables

(defgroup doom-xresources-theme nil
  "Options for the `doom-xresources' theme."
  :group 'doom-themes)

(defcustom doom-xresources-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-xresources-theme
  :type 'boolean)

(defcustom doom-xresources-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-xresources-theme
  :type 'boolean)

(defcustom doom-xresources-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-xresources-theme
  :type '(choice integer boolean))

;;
;;; Colors by the standard Xresources format

(setq x-foreground (xresources-theme-color "foreground"))
(setq x-background (xresources-theme-color "background"))

(setq x-black (xresources-theme-color "color8"))
(setq x-bright-red (xresources-theme-color "color9"))
(setq x-bright-green (xresources-theme-color "color10"))
(setq x-bright-yellow (xresources-theme-color "color11"))
(setq x-bright-blue (xresources-theme-color "color12"))
(setq x-bright-magenta (xresources-theme-color "color13"))
(setq x-bright-cyan (xresources-theme-color "color14"))
(setq x-light-gray (xresources-theme-color "color15"))

(setq x-gray (xresources-theme-color "color0"))
(setq x-red (xresources-theme-color "color1"))
(setq x-green (xresources-theme-color "color2"))
(setq x-yellow (xresources-theme-color "color3"))
(setq x-blue (xresources-theme-color "color4"))
(setq x-magenta (xresources-theme-color "color5"))
(setq x-cyan (xresources-theme-color "color6"))
(setq x-white (xresources-theme-color "color7"))

;;
;;; Theme definition

(def-doom-theme doom-xresources
  "A dark theme inspired by Atom One Dark."

  ;; name        default   256           16
  ((bg          (list x-background x-background       "black"  ))
   (fg          (list x-foreground x-foreground       "brightwhite"  ))

   ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
   ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
   ;; or region), especially when paired with the `doom-darken', `doom-lighten',
   ;; and `doom-blend' helper functions.
   (bg-alt      (list x-black x-black       "black"        ))
   (fg-alt      (list x-white x-black       "white"        ))

   ;; These should represent a spectrum from bg to fg, where base0 is a starker
   ;; bg and base8 is a starker fg. For example, if bg is light grey and fg is
   ;; dark grey, base0 should be white and base8 should be black.
   (base0       '("#1B2229"      "black"       "black"        ))
   (base1       '("#1c1f24"      "#1e1e1e"     "brightblack"  ))
   (base2       '("#202328"      "#2e2e2e"     "brightblack"  ))
   (base3       '("#23272e"      "#262626"     "brightblack"  ))
   (base4       '("#3f444a"      "#3f3f3f"     "brightblack"  ))
   (base5       '("#5B6268"      "#525252"     "brightblack"  ))
   (base6       '("#73797e"      "#6b6b6b"     "brightblack"  ))
   (base7       '("#9ca0a4"      "#979797"     "brightblack"  ))
   (base8       '("#DFDFDF"      "#dfdfdf"     "white"        ))

   (grey        x-gray)
   (orange      (list x-red             x-red               "red"          ))
   (red         (list x-bright-red      x-bright-red        "brightred"    ))
   (teal        (list x-green           x-green             "green"        ))
   (green       (list x-bright-green    x-bright-green      "brightgreen"  ))
   (yellow      (list x-yellow          x-yellow            "yellow"       ))
   (dark-yellow (list x-bright-yellow   x-bright-yellow     "brightyellow" ))
   (blue        (list x-blue            x-blue              "brightblue"   ))
   (dark-blue   (list x-bright-blue     x-bright-blue       "blue"         ))
   (magenta     (list x-magenta         x-magenta           "brightmagenta"))
   (violet      (list x-bright-magenta  x-bright-magenta    "magenta"      ))
   (cyan        (list x-cyan            x-cyan              "brightcyan"   ))
   (dark-cyan   (list x-bright-cyan     x-bright-cyan       "cyan"         ))

   ;; These are the "universal syntax classes" that doom-themes establishes.
   ;; These *must* be included in every doom themes, or your theme will throw an
   ;; error, as they are used in the base theme defined in doom-themes-base.
   (highlight      teal)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      grey)
   (builtin        magenta)
   (comments       (if doom-xresources-brighter-comments dark-cyan grey))
   (doc-comments   (doom-lighten (if doom-xresources-brighter-comments dark-cyan base5) 0.25))
   (constants      violet)
   (functions      magenta)
   (keywords       blue)
   (methods        cyan)
   (operators      blue)
   (type           yellow)
   (strings        teal)
   (variables      (doom-lighten magenta 0.4))
   (numbers        orange)
   (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base1) 0.35)))
   (error          red)
   (warning        dark-yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; These are extra color variables used only in this theme; i.e. they aren't
   ;; mandatory for derived themes.
   (modeline-fg              fg)
   (modeline-fg-alt          base5)
   (modeline-bg              (if doom-xresources-brighter-modeline
                                 (doom-darken cyan 0.45)
                               (doom-darken bg-alt 0.1)))
   (modeline-bg-alt          (if doom-xresources-brighter-modeline
                                 (doom-darken cyan 0.475)
                               `(,(doom-darken (car bg-alt) 0.15) ,@(cdr bg))))
   (modeline-bg-inactive     `(,(car bg-alt) ,@(cdr base1)))
   (modeline-bg-inactive-alt `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg)))

   (-modeline-pad
    (when doom-xresources-padded-modeline
      (if (integerp doom-xresources-padded-modeline) doom-xresources-padded-modeline 4))))


  ;;;; Base theme face overrides
  (((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)
   ((font-lock-comment-face &override)
    :background (if doom-xresources-brighter-comments (doom-lighten bg 0.05)))
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if doom-xresources-brighter-modeline base8 highlight))

   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar :background (if doom-xresources-brighter-modeline modeline-bg highlight))
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground teal :weight 'bold)
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; ivy
   (ivy-current-match :background dark-blue :distant-foreground base0 :weight 'normal)
   ;;;; LaTeX-mode
   (font-latex-math-face :foreground cyan)
   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))
   ;;;; rjsx-mode
   (rjsx-tag :foreground red)
   (rjsx-attr :foreground orange)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-alt))))

  ;;;; Base theme variable overrides-
  ())

;;; doom-xresources-theme.el ends here
