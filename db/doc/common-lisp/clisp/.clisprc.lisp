(setf *load-verbose* nil)
(setf *old-standard-output* *standard-output*)
(setf *standard-output* (make-broadcast-stream))

;;; The following lines added by ql:add-to-init-file:
#-quicklisp
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

(defun project-setup ()
    (mapcar #'(lambda (path) (push path asdf:*central-registry*))
        '(#p"/mnt/D/qachina/db/doc/money/"
          #p"/mnt/D/qachina/")))

(project-setup)
(ql:quickload :money)

(setf *standard-output* *old-standard-output*)
