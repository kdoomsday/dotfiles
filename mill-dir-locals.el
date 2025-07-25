;; Dir locals for a Mill project. Rename to .dir-locals.el
((scala-mode . ((projectile-project-run-cmd . "./mill --ticker false core.run")
                (projectile-project-compilation-cmd . "./mill --ticker false __.compile")
                (projectile-project-test-cmd . "./mill --ticker false __.test"))))
