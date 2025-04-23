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

(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />")

;; define the publishing project
(setq org-publish-project-alist
      (list
       (list "drlikith-website"
	     :recursive t
		 :base-url "https://likithjai.github.io/drlikith-website/"
	     :base-directory "./content"
	     :publishing-directory "./docs"
	     :publishing-function 'org-html-publish-to-html
	     :with-author nil ;; doesn't include author name
	     :with-creator nil ;;include emacs and org versions in footer
	     :with-toc nil ;;include a table of contents
	     :section-numbers nil ;; don't include section numbers
	     :time-stamp-file nil))) ;; don't include timestamp in file
(setq org-html-validation-link nil ;; don't show validation link
	  org-html-head-include-scripts nil ;; use our own scripts
	  org-html-head-include-default-style nil ;; use our own styles
	  org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />")
(org-publish-all t)


(message "build complete!")
