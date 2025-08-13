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
(setq doom-font (font-spec :family "Aporetic Sans Mono" :size 15)
      doom-big-font (font-spec :family "Aporetic Sans Mono" :size 20)
      doom-serif-font (font-spec :family "Aporetic Serif" :size 15)
      doom-variable-pitch-font (font-spec :family "Aporetic Sans" :height 1.0))

(add-hook! 'org-mode-hook #'mixed-pitch-mode)
;;(add-hook! 'org-mode-hook #'solaire-mode)
(setq mixed-pitch-variable-pitch-cursor nil)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one-light)
;;(setq doom-theme 'doric-earth)
(setq doom-theme 'modus-operandi)

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

;; This is a an example configuration of the doric themes, but I don't think
;; it is necessary in Doom.
;;
;; (use-package! doric-themes
;;   :ensure t
;;   :demand t
;;   :config
;;   ;; These are the default values.
;;   (setq doric-themes-to-toggle '(doric-light doric-dark))
;;   (setq doric-themes-to-rotate doric-themes-collection)

;;   (doric-themes-select 'doric-light)

;;   ;; ;; To load a random theme instead, use something like one of these:
;;   ;;
;;   ;; (doric-themes-load-random)
;;   ;; (doric-themes-load-random 'light)
;;   ;; (doric-themes-load-random 'dark)

;;   ;; ;; For optimal results, also define your preferred font family (or use my `fontaine' package):
;;   ;;
;;   (set-face-attribute 'default nil :family "Aporetic Sans Mono" :height 160)
;;   (set-face-attribute 'variable-pitch nil :family "Aporetic Sans" :height 1.0)
;;   (set-face-attribute 'fixed-pitch nil :family "Aporetic Sans Mono" :height 1.0)
;; )

(add-transient-hook! 'focus-out-hook (atomic-chrome-start-server))

;; Sometimes I do :q! and close Emacs by mistake...
(setq confirm-kill-emacs #'yes-or-no-p)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Library/CloudStorage/Dropbox/org/")
(setq org-journal-dir (concat org-directory "journal/"))
(setq org-journal-file-type 'weekly)
(setq org-journal-file-format "%Y%m%d.org")
(setq org-journal-date-format "%A, %d/%m/%Y")

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
;;
;;
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; GPG
(setq epa-file-encrypt-to '("devide.aversa@proton.me"))

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

;;
;; Org-Mode Configurations
;;

(after! org

  ;; Calendar configuration
  (setq org-agenda-start-on-weekday 1)
  (setq calendar-week-start-day 1)
  (add-to-list 'org-modules 'org-habit)

  ;; Capture Templates
  (setq org-capture-templates
      `(("i" "Inbox" entry (file+headline ,(expand-file-name "main.org" org-directory) "Inbox")
         "* TODO %^{task}")
        ("b" "Blog Post" entry (file+headline ,(expand-file-name "main.org" org-directory) "Blog")
         "* TODO Blog Post on %^{title} [0/2]\n** - [ ] Research and Drafting\n** - [ ] Editing and Publishing\n")
        ("j" "Jira Task" entry (file+headline ,(expand-file-name "helvia.org" org-directory) "AI Lab Tasks")
         "* TODO [%^{ticket}] %^{title}\n[[https://helvia.atlassian.net/browse/%\\1][Link to Ticket]]")
        ("r" "Book" entry (file+headline ,(expand-file-name "reading.org" org-directory) "Reading List")
          "* TO-READ %^{author} - %^{title}")
        ("C" "The ChangeLog" entry (file+headline ,(expand-file-name "main.org" org-directory) "Blog")
          "* TODO Publish The Changelog - %<%B %Y> [0%]\n** TODO Write The Changelog Draft\n** TODO Final editing of The Changelog on Buttondown")))

  (setq org-log-into-drawer t)
  (setq org-log-done 'time)
  (setq org-fontify-done-headline t)
  (set-face-attribute 'org-done nil :strike-through t)

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

  (setq! org-todo-keywords
      '((sequence
         "TODO(t)"
         "STRT(s)"
         "WAIT(w@)"
         "PROJ(p)"
         "|"
         "DONE(d!)"
         "KILL(c!)" )))

  (setq! org-todo-keyword-faces
      '(("TODO" :foreground "#cc4d3e" :weight bold)
       ("STRT" :foreground "#85C7A1" :weight bold)
       ("WAIT" :foreground "#83898d" :weight bold)
       ("PROJ" :foreground "#896ccc" :weight bold)
       ("DONE" :foreground "#2b8c63" :weight bold)
       ("KILL" :foreground "#5d6265" :weight bold)))
  )

; I am not able to make this work. Let's try again anothe time.
;
;(add-hook! org-load (setq org-todo-keyword-faces
;      '(("TODO" . org-warning) ("STARTED" . "yellow")
;        ("CANCELED" . (:foreground "blue" :weight bold)))))

; Deft
(setq deft-extensions '("txt" "md" "org")
      deft-directory (concat org-directory "notes")
      deft-recursive t
      deft-use-filter-string-for-filename t)

; Markdown
(setq markdown-enable-wiki-links t)
(setq markdown-link-space-sub-char " ")

; Spellcheck
(setq ispell-program-name "aspell")
(setq ispell-dictionary "en_US")

(setq obsidian-directory "~/Documents/Notes")
;; If you want a different directory of `obsidian-capture':
(setq obsidian-inbox-directory "_Inbox")
(setq obsidian-daily-notes-directory "06 - Time")

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
(setq calibredb-root-dir "~/Library/CloudStorage/Dropbox/Books/Library")
(setq calibredb-db-dir (expand-file-name "metadata.db" calibredb-root-dir))
(setq calibredb-library-alist '(("~/Library/CloudStorage/Dropbox/Books/Library")))

;; Remap jk to ESC
(use-package! key-chord
  :config
  (key-chord-mode 1)
  (setq key-chord-two-keys-delay 0.5)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state))

;; Denote
(use-package denote
  :ensure t
  :hook (dired-mode . denote-dired-mode)
  :bind
  (("C-c n n" . denote)
   ("C-c n r" . denote-rename-file)
   ("C-c n l" . denote-link)
   ("C-c n b" . denote-backlinks)
   ("C-c n d" . denote-dired)
   ("C-c n g" . denote-grep))
  :config
  (setq denote-directory (expand-file-name (concat org-directory "notes")))

  ;; Automatically rename Denote buffers when opening them so that
  ;; instead of their long file name they have, for example, a literal
  ;; "[D]" followed by the file's title.  Read the doc string of
  ;; `denote-rename-buffer-format' for how to modify this.
  (denote-rename-buffer-mode 1))


;; Tell Emacs where to get the Typst grammar
(when (boundp 'treesit-language-source-alist)
  (setq treesit-language-source-alist
        (append treesit-language-source-alist
                '((typst . ("https://github.com/uben0/tree-sitter-typst"))))))

;; Enable Harper in Eglot 
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(markdown-mode . ("harper-ls" "--stdio"))))

;;;;
;;;; Keybindings
;;;;

(map! :leader
      (:prefix ("j" . "journal") ;; org-journal bindings
        :desc "Create new journal entry" "j" #'org-journal-new-entry
        :desc "Open previous entry" "p" #'org-journal-open-previous-entry
        :desc "Open next entry" "n" #'org-journal-open-next-entry
        :desc "Search journal" "s" #'org-journal-search-forever))

;; The built-in calendar mode mappings for org-journal
;; conflict with evil bindings
(map!
 (:map calendar-mode-map
   :n "o" #'org-journal-display-entry
   :n "p" #'org-journal-previous-entry
   :n "n" #'org-journal-next-entry
   :n "O" #'org-journal-new-date-entry))

;; Local leader (<SPC m>) bindings for org-journal in calendar-mode
;; I was running out of bindings, and these are used less frequently
;; so it is convenient to have them under the local leader prefix
(map!
 :map (calendar-mode-map)
 :localleader
 "w" #'org-journal-search-calendar-week
 "m" #'org-journal-search-calendar-month
 "y" #'org-journal-search-calendar-year)

;;
;; CUSTOM FUNCTIONS
;;

(defun +org-export-done-tasks-for-date (date)
  "Export all DONE tasks for a specific date in the format:
* [x] <Task Title> <Timestamp>"
  (interactive "sEnter date (YYYY-MM-DD): ")
  (let ((output-buffer (get-buffer-create "*Done Tasks Export*"))
        (results '()))

    (with-current-buffer output-buffer
      (erase-buffer)
      (insert (format "# Done Tasks for %s\n\n" date)))

    ;; Search through all org files in agenda
    (dolist (file (org-agenda-files))
      (when (file-exists-p file)
        (with-temp-buffer
          (insert-file-contents file)
          (goto-char (point-min))

          ;; Search for DONE tasks with regex
          (while (re-search-forward "^\\*+\\s-+DONE\\s-+\\(.+\\)$" nil t)
            (let* ((task-title (string-trim (match-string 1)))
                   (task-start (match-beginning 0))
                   (task-end (save-excursion
                              (if (re-search-forward "^\\*+" nil t)
                                  (match-beginning 0)
                                (point-max))))
                   (timestamp nil))

              ;; Look for CLOSED timestamp in the task section
              (save-excursion
                (goto-char task-start)
                (when (re-search-forward (concat "CLOSED: \\[" date "[^]]*\\]") task-end t)
                  (setq timestamp (match-string 0))))

              ;; If we found a CLOSED timestamp for the requested date, add to results
              (when timestamp
                (push (cons task-title timestamp) results)))))))

    ;; Output results
    (dolist (result (reverse results))
      (with-current-buffer output-buffer
        (insert (format "* [x] %s %s\n" (car result) (cdr result)))))

    ;; If no results, show debug info
    (when (not results)
      (with-current-buffer output-buffer
        (insert "No DONE tasks found for this date.\n\n")
        (insert "Debug: Searching for tasks with DONE state\n")
        (insert (format "Debug: Looking for CLOSED timestamps containing '%s'\n" date))
        (insert (format "Debug: Agenda files: %s\n" (org-agenda-files)))))

    ;; Display the results
    (switch-to-buffer output-buffer)
    (org-mode)))

(defun +org-export-done-tasks-today ()
  "Export all DONE tasks for today."
  (interactive)
  (+org-export-done-tasks-for-date (format-time-string "%Y-%m-%d")))
