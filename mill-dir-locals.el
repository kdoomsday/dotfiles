;; Dir locals for a Mill project. Rename to .dir-locals.el
((scala-ts-mode . ((projectile-project-type . 'mill)
                   (projectile-project-test-suffix . "Test")
                   (projectile-project-run-cmd . "./mill --ticker=false core.run")
                   (projectile-project-compilation-cmd . "./mill --ticker=false __.compile")
                   (projectile-project-test-cmd . "./mill --ticker=false __.test"))))
