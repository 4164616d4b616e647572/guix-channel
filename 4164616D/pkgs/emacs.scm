(define-module (4164616D pkgs emacs)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system emacs)
  #:use-module (gnu packages emacs-xyz))

(define-public emacs-stuff
  (let ((revision "4")
        (commit "9b1eed2ac2b5c2f645877d7e1ec5dae0c8b7ecf2")
        (git-page "https://github.com/4164616d4b616e647572/stuff"))
    (package
      (name "emacs-stuff")
      (version (git-version "0.1" revision commit))
      (source
       (origin
	 (method git-fetch)
	 (uri (git-reference
	       (url git-page)
	       (commit commit)))
	 (file-name (git-file-name name version))
	 (sha256
	  (base32 "08ap9024zwsznjjmczjkhksrrljzknz3csx9c9kxd2g9pb8sbvkn"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-async))
      (arguments
       `(#:include '("\\.el$")))
      (home-page git-page)
      (synopsis "my emacs package")
      (description "my emacs package")
      (license license:gpl3+))))
