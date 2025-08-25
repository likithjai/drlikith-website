;;; blog-capture.el --- Hugo Org Capture Integration -*- lexical-binding: t; -*-

(setq org-directory "~/Documents/website/drlikith-website/org/")
(setq org-default-notes-file (expand-file-name "posts/inbox.org" org-directory))
(use-package! ox-hugo
  :after ox)
(after! org
  (add-to-list 'org-capture-templates
               '("b" "Blog Post" plain
                 (file (lambda ()
                         (let* ((title (read-string "Post title: "))
                                (slug (replace-regexp-in-string
                                       " " "-" (downcase
                                                (replace-regexp-in-string "[^a-zA-Z0-9 ]" "" title))))
                                (filename (format "posts/%s-%s.org"
                                                  (format-time-string "%Y-%m-%d") slug)))
                           (set-register ?t title)
                           (expand-file-name filename org-directory))))
                 "#+TITLE: %(get-register ?t)\n#+DATE: %U\n#+author: likith\n#+HUGO_DRAFT: true\n#+HUGO_BASE_DIR: ~/Documents/website/drlikith-website/\n#+HUGO_SECTION: posts\n#+HUGO_FRONT_MATTER_FORMAT: yaml\n\n* %?"
                 :empty-lines 1
                 :immediate-finish nil
                 :unnarrowed t)))
