;; load the publishing system
(require 'ox-publish)

;; define the publishing project
(setq org-publish-project-alist
      (list
       (list "drlikith-website"
	     :recursive t
	     :base-directory "./content"
	     :publishing-directory "./public"
	     :publishing-function 'org-html-publish-to-html)))
(org-publish-all t)


(message "build complete!")
