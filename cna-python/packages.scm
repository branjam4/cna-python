(define-module (cna-python packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages graphviz)
  #:use-module ((guix licenses) #:prefix license:))

(let ((%nltk-hash-result '"0d28rfnvxlxi7cq0zzcpcln3c6l1f2kipmgbpcab6gcq3nbzjq96")
      (%pygraphviz-hash-result '"0s1mw2r0dpra92r2pkxplwl5a2bkjyarrq2i5cs5df1wyk3qj9j8"))

  (define-public python-wikipedia
    (package
      (name "python-wikipedia")
      (version "1.4.0")
      (source
       (origin
         (method url-fetch)
         (uri (pypi-uri "wikipedia" version))
         (sha256
          (base32
           "1cikc7ibi2qc5vfrcabdg304s84qcf2yj1i3hnql3m7x54cas3yv"))))
      (build-system python-build-system)
      (propagated-inputs
       `(("python-beautifulsoup4" ,python-beautifulsoup4)
         ("python-requests" ,python-requests)))
      (home-page
       "https://github.com/goldsmith/Wikipedia")
      (synopsis "Wikipedia API for Python")
      (description "Wikipedia API for Python")
      (license license:expat)))


  (define-public python-toposort
    (package
      (name "python-toposort")
      (version "1.5")
      (source
       (origin
         (method url-fetch)
         (uri (pypi-uri "toposort" version))
         (sha256
          (base32
           "1papqmv5930xl3d5mx2drnwdxg7y1y3l1ij2n0vvzqwnaa2ax9fv"))))
      (build-system python-build-system)
      (home-page
       "https://bitbucket.org/ericvsmith/toposort")
      (synopsis
       "Implements a topological sort algorithm.")
      (description
       "Implements a topological sort algorithm.")
      (license #f)))


  (define-public python-community
    (package
      (name "python-community")
      (version "1.0.0b1")
      (source
       (origin
         (method url-fetch)
         (uri (pypi-uri "community" version))
         (sha256
          (base32
           "01c5wwalyb0ikfqjbimnlgn0a92rcnsbmx09vzr2hkfhbq81yld7"))))
      (build-system python-build-system)
      (home-page
       "https://github.com/ewdurbin/community")
      (synopsis
       "merge together wellness checks to unify your shit")
      (description
       "merge together wellness checks to unify your shit")
      (license license:expat)))


  (define-public python-louvain
    (package
      (name "python-louvain")
      (version "0.14")
      (source
       (origin
         (method url-fetch)
         (uri (pypi-uri "python-louvain" version))
         (sha256
          (base32
           "0l89vxibnjw3dfp90vx4v9gfaql84sc6479arl859d473rx0r9g0"))))
      (build-system python-build-system)
      (propagated-inputs
       `(("python-networkx" ,python-networkx)
         ("python-numpy" ,python-numpy)))
      (home-page
       "https://github.com/taynaud/python-louvain")
      (synopsis
       "Louvain algorithm for community detection")
      (description
       "Louvain algorithm for community detection")
      (license license:bsd-3)))


  (define-public cna-python-nltk
    (package (inherit python-nltk)
             (version "3.2.5")
             (source (origin
                       (method url-fetch)
                       (uri (pypi-uri "nltk" version))
                       (sha256
                        (base32
                         %nltk-hash-result))))))


  (define-public cna-python-pygraphviz
    (package (inherit python-pygraphviz)
             (version "1.3")
             (source
              (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/pygraphviz/pygraphviz")
                      (commit (string-append "pygraphviz-" version))))
                (file-name (string-append "pygraphviz-" version "-checkout"))
                (sha256
                 (base32
                  %pygraphviz-hash-result))))))
  )
