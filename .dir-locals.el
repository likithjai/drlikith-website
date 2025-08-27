((org-mode . ((eval . (add-hook 'after-save-hook
                                 (lambda ()
                                   (when (and buffer-file-name
                                              (string= (file-name-extension buffer-file-name) "org"))
                                     (org-md-export-to-markdown)))
                                 nil
                                 'local))))
