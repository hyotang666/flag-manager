(in-package :flag-manager)

(defparameter *flags* 0)

(defparameter *flag-counter* 0)

(defun set-flags(operate &rest flags)
  (unless(find operate '(:on :off))
	 (error "SET-FLAG's 1st argument is one of (:on :off).~&~
		Current argument is ~A"operate))
  (mapc #'(lambda(flag)
		 (setf(ldb(byte 1 flag)*flags*)
		      (if(eq operate :on)
			 1
			 0)))
	flags))

(defun flag-on-p(flag)
  (declare(type integer flag))
  (logbitp flag *flags*))

(defun flag-off-p(flag)
  (declare(type integer flag))
  (not(flag-on-p flag)))

(defmacro deflag(name)
  `(prog1(defconstant ,name *flag-counter*)
	 (incf *flag-counter*)))
