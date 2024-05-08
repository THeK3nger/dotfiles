;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Davide Aversa"
      user-mail-address "thek3nger@gmail.com")

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
(setq doom-font (font-spec :family "Monaspace Argon" :size 12 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Charter" :size 14))

(add-hook! 'org-mode-hook #'mixed-pitch-mode)
;;(add-hook! 'org-mode-hook #'solaire-mode)
(setq mixed-pitch-variable-pitch-cursor nil)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")
(setq org-roam-directory "~/Dropbox/org/notes/")
(setq org-journal-dir "~/Dropbox/org/journal/")
(setq org-journal-file-type 'weekly)
(setq org-journal-file-format "%Y%m%d.org")

(setq org-id-method 'ts)

;; Force system time locale to English
(setq system-time-locale "C")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

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

;; Holidays
(setq holiday-general-holidays
      '((holiday-fixed 1 1 "Capodanno")
        (holiday-fixed 5 1 "1 Maggio")
        (holiday-fixed 4 25 "Liberazione")
        (holiday-fixed 6 2 "Festa Repubblica")
))

(setq holiday-christian-holidays
     '((holiday-fixed 12 8 "Immacolata Concezione")
       (holiday-fixed 12 25 "Natale")
       (holiday-fixed 12 26 "Santo Stefano")
       (holiday-fixed 1 6 "Epifania")
       (holiday-easter-etc -52 "Giovedì grasso")
       (holiday-easter-etc -47 "Martedì grasso")
       (holiday-easter-etc  -2 "Venerdì Santo")
       (holiday-easter-etc   0 "Pasqua")
       (holiday-easter-etc  +1 "Lunedì Pasqua")
       (holiday-fixed 8 15 "Assunzione di Maria")
       (holiday-fixed 11 1 "Ognissanti")
       ))

(setq holiday-hebrew-holidays nil)
(setq holiday-islamic-holidays nil)
(setq holiday-bahai-holidays nil)
(setq holiday-oriental-holidays nil)

;; Calendar configuration
(setq org-agenda-start-on-weekday 1)
(setq calendar-week-start-day 1)

;; Org-Mode Configurations

(after! org
  (add-to-list 'org-modules 'org-habit)
  ;; Capture Templates
  (setq org-capture-templates
      '(("b" "Blog Post" entry (file+headline "~/Dropbox/org/main.org" "Blog")
         "* TODO Blog Post on %^{title} [/]\n** TODO Research and Drafting\n** TODO Editing and Publishing\n"
         )))
  )

(setq org-log-into-drawer t)
(setq org-log-done 'time)

(setq org-agenda-custom-commands
      '(("n" "Agenda and all TODOs"
                agenda ""
                ((alltodo "")))))

(setq org-agenda-log-mode-items '(closed clock state))

(add-to-list 'org-agenda-custom-commands
             '("W" "Weekly review"
               agenda ""
               ((org-agenda-start-day "-14d")
                (org-agenda-span 15)
                ;;(org-agenda-start-on-weekday 1)
                (org-agenda-start-with-log-mode '(closed clock))
                (org-agenda-skip-function '(org-agenda-skip-entry-if 'nottodo 'done)))))


; I am not able to make this work. Let's try again anothe time.
;
;(add-hook! org-load (setq org-todo-keyword-faces
;      '(("TODO" . org-warning) ("STARTED" . "yellow")
;        ("CANCELED" . (:foreground "blue" :weight bold)))))

; Deft
(setq deft-extensions '("txt" "md" "org")
      deft-directory "~/Dropbox/Notes"
      deft-recursive t
      deft-use-filename-as-title t
      deft-use-filter-string-for-filename t)

; Markdown
(setq markdown-enable-wiki-links t)
(setq markdown-link-space-sub-char " ")

; Spellcheck
(setq ispell-program-name "aspell")
(setq ispell-dictionary "en_US")

; Relative Numbers
(setq display-line-numbers 'relative)

(obsidian-specify-path "~/Dropbox/Notes")
;; If you want a different directory of `obsidian-capture':
(setq obsidian-inbox-directory "_Inbox")

;; Replace standard command with Obsidian.el's in obsidian vault:
;; (bind-key (kbd "C-c C-o") 'obsidian-follow-link-at-point 'obsidian-mode-map)

;; Use either `obsidian-insert-wikilink' or `obsidian-insert-link':
;; (bind-key (kbd "C-c C-l") 'obsidian-insert-wikilink 'obsidian-mode-map)

;; Following backlinks
;; (bind-key (kbd "C-c C-b") 'obsidian-backlink-jump 'obsidian-mode-map)


;; Optionally you can also bind `obsidian-jump' and `obsidian-capture'
;; replace "YOUR_BINDING" with the key of your choice:
;; (bind-key (kbd "YOUR_BINDING") 'obsidian-jump)
;; (bind-key (kbd "YOUR_BINDING") 'obsidian-capture)
;; detecting of Obsidian vault
(global-obsidian-mode t)

(setq mastodon-instance-url "https://mastodon.social"
      mastodon-active-user "thek3nger")

;; To open files with .journal extension in hledger-mode
(add-to-list 'auto-mode-alist '("\\.journal\\'" . ledger-mode))

;; Calibre DB
(setq calibredb-root-dir "~/Dropbox/Books/Library")
(setq calibredb-db-dir (expand-file-name "metadata.db" calibredb-root-dir))
(setq calibredb-library-alist '(("~/Dropbox/Books/Library")))
