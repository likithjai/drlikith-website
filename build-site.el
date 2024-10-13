;; load the publishing system
(require 'ox-publish)

;; define the publishing project
(setq org-publish-project-alist
      (list
       (list "drlikith-website"
	     :recursive t
	     :base-directory "./content"
	     :publishing-directory "./public"
	     :publishing-function 'org-html-publish-to-html
	     :with-author nil ;; doesn't include author name
	     :with-creator t ;;include emacs and org versions in footer
	     :with-toc t ;;include a table of contents
	     :section-numbers nil ;; don't include section numbers
	     :time-stamp-file nil))) ;; don't include timestamp in file
(org-publish-all t)


(message "build complete!")
