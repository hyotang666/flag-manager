(defsystem :flag-manager
 :version "0.0.0"
 :components ((:file "package")
	 (:file "flag-manager" :depends-on ("package")))
