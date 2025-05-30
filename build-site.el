;; set the package installation directory so that packages aren't stored in the ~/.emacs.d/elpa path

(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

;; intialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; install dependencies
(package-install 'htmlize)



;; load the publishing system
(require 'ox-publish)

(require 'org)
(require 'ob-core)
(require 'ob-lisp)

(defun update-blog-index ()
  (interactive)
  (find-file "./content/blog-index.org")
  (org-ctrl-c-ctrl-c) ;execute the elisp code
  (save-buffer)
  (org-html-export-to-html))



(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (shell . t)
   (python . t)))

(setq org-confirm-babel-evaluate
	  (lambda (lang body)
		(not (member lang '("emacs-lisp" "python")))))

(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      org-export-with-section-numbers nil
      org-html-head "<link rel=\"stylesheet\" href=\"/styles/styles.css\" />")

(setq org-publish-project-alist
      `(("site-content"
         :base-directory "./content"
         :base-extension "org"
         :publishing-directory "."
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :auto-preamble t
		 :html-postamble nil
         :auto-sitemap nil  ; We'll handle the blog index separately
         :htmlized-source t
		 :with-toc nil
         :html-head ,org-html-head)
        
        ;; ("site-blog-posts"
        ;;  :base-directory "./content/blog/posts"
        ;;  :base-extension "org"
        ;;  :publishing-directory "."
        ;;  :recursive nil
        ;;  :publishing-function org-html-publish-to-html
        ;;  :section-numbers nil
        ;;  :with-toc nil
		;;  :html-postamble nil
		;;  :html-head ,org-html-head
        ;;  :htmlized-source t)
        
        ("site-blog-index"
         :base-directory "./content"
         :base-extension "org"
         :publishing-directory "."
         :recursive nil
         :publishing-function org-html-publish-to-html
         :auto-sitemap nil
		 :with-toc nil
		 :section-numbers nil
		 :html-head ,org-html-head
		 :html-postamble nil
         :htmlized-source t)
        
        ("site" :components ("site-content" "site-blog-index"))))



;; Enable essential org features

(org-publish-all t)

(update-blog-index)

(message "build complete!")
