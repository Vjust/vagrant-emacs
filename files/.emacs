;------------ setup package manager --------------------
                                                        
(require 'git)

(defun replace-yank ()
  """ Yanks and replaces a characker """
  (interactive)
  	(with-temp-buffer
  	  (yank)
  	  (beginning-of-buffer)
  	  (while (re-search-forward "^\*" nil t)
  	    (replace-match "+" nil t))
  	  (kill-region (point-min) (point-max))
	)
	(yank)
 )
