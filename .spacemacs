;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(typescript
     rust
     toml
     colors
     ;; Completion framework
     ;; compleseus
     ;; helm
     ;; (ivy :variables
     ;;      ivy-enable-advanced-buffer-information t
     ;;      ivy-enable-icons t)
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; (colors :variables
     ;;         colors-enable-nyan-cat-progress-bar (display-graphic-p))
     csv
     docker
     ;; dtrt-indent ; Consider this one
     ;; haskell
     emacs-lisp
     ;; emoji
     epub
     (git :variables
          git-enable-magit-gitflow-plugin t
          git-enable-magit-delta-plugin t)
     graphviz
     html
     (java :variables java-backend 'lsp)
     javascript
     llm-client
     markdown
     mermaid
     multiple-cursors
     ;; (treemacs :variables
     ;;           treemacs-use-scope-type 'Perspectives
     ;;           treemacs-use-git-mode 'deferred)
     (org :variables
          org-enable-verb-support t
          org-enable-roam-support t
          org-enable-roam-ui t)
     python
     react
     (scala :variables
            scala-backend 'scala-metals
            scala-auto-insert-asterisk-in-comments t
            scala-indent:use-javadoc-style t
            lsp-metals-server-args '("-J-Dmetals.allow-multiline-string-formatting=off"))
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-term-shell "/usr/bin/zsh"
            ;; shell-default-shell 'vterm
            close-window-with-terminal t)
     shell-scripts
     spacemacs-org
     spotify
     sql
     tabs
     terraform
     themes-megapack
     treemacs
     tree-sitter
     (unicode-fonts :variables unicode-fonts-enable-ligatures t)
     (spell-checking :variables
                     spell-checking-enable-by-default nil
                     enable-flyspell-auto-completion t)
     syntax-checking
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-diff-side 'left)
     windows-scripts
     auto-completion
     xkcd
     yaml

     ;; My own layers
     ;; my-ellama
     compleseus-plus
     scala-extras
     ;; tabbar
     ;; centaur-tabs
     ;; logview
     ;; flyover
     ollama-buddy
     )

   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(beacon tmr logview smithy-mode)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 2048 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((projects . 5))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "nerd-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light). A theme from external
   ;; package can be defined with `:package', or a theme can be defined with
   ;; `:location' to download the theme package, refer the themes section in
   ;; DOCUMENTATION.org for the full theme specifications.
   dotspacemacs-themes '(doom-one
                         spacemacs-dark
                         spacemacs-light
                         doom-one-light
                         madhat2r
                         naquadah)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   ;; dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.9)
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.4)
   ;; dotspacemacs-mode-line-theme '(vim-powerline)
   ;; dotspacemacs-mode-line-theme '(all-the-icons :separator arrow :separator-scale 1.2 :scale 1.1)
   ;; dotspacemacs-mode-line-theme '(all-the-icons :separator-scale 1.5 )
   ;; dotspacemacs-mode-line-theme '(all-the-icons)
   ;; dotspacemacs-mode-line-theme '(doom)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. This setting has no effect when
   ;; running Emacs in terminal. The font set here will be used for default and
   ;; fixed-pitch faces. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Fira Code"
                               :size 10.0
                               :weight normal
                               :width normal)

   ;; Default icons font, it can be `all-the-icons' or `nerd-icons'.
   dotspacemacs-default-icons-font 'all-the-icons

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "M-<return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "M-<return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 5

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'original

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state t

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; It is also possible to use a posframe with the following cons cell
   ;; `(posframe . position)' where position can be one of `center',
   ;; `top-center', `bottom-center', `top-left-corner', `top-right-corner',
   ;; `top-right-corner', `bottom-left-corner' or `bottom-right-corner'
   ;; (default 'bottom)
   ;; dotspacemacs-which-key-position 'bottom
   dotspacemacs-which-key-position '(posframe . bottom-center)

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; Whether side windows (such as those created by treemacs or neotree)
   ;; are kept or minimized by `spacemacs/toggle-maximize-window' (SPC w m).
   ;; (default t)
   dotspacemacs-maximize-window-keep-side-windows t

   ;; If nil, no load-hints enabled. If t, enable the `load-hints' which will
   ;; put the most likely path on the top of `load-path' to reduce walking
   ;; through the whole `load-path'. It's an experimental feature to speedup
   ;; Spacemacs on Windows. Refer the FAQ.org "load-hints" session for details.
   dotspacemacs-enable-load-hints nil

   ;; If t, enable the `package-quickstart' feature to avoid full package
   ;; loading, otherwise no `package-quickstart' attemption (default nil).
   ;; Refer the FAQ.org "package-quickstart" section for details.
   dotspacemacs-enable-package-quickstart nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 100

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers '(:t
                               :disabled-for-modes org-mode)

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; The backend used for undo/redo functionality. Possible values are
   ;; `undo-fu', `undo-redo' and `undo-tree' see also `evil-undo-system'.
   ;; Note that saved undo history does not get transferred when changing
   ;; your undo system. The default is currently `undo-fu' as `undo-tree'
   ;; is not maintained anymore and `undo-redo' is very basic."
   dotspacemacs-undo-system 'undo-tree

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "[%t]  %a  %p"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; The variable `global-spacemacs-whitespace-cleanup-modes' controls
   ;; which major modes have whitespace cleanup enabled or disabled
   ;; by default.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  ;; (setq-default git-magit-status-fullscreen t,
  ;;               magit-diff-paint-whitespace t,
  ;;               magit-diff-paint-whitespace-lines 'all,
  ;;               magit-diff-refine-hunk t))
  (setq org-roam-v2-ack t)

  ;; Use in-Emacs passwords for GPG
  ;; (setenv "GPG_AGENT_INFO" "/home/doomsday/bin/pinentry-emacs")

  (setq-default git-magit-status-fullscreen t))

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (spacemacs/toggle-vi-tilde-fringe-off)
  (defun my/super-maximize-buffer ()
    "Maximize buffer and close treemacs, if necessary"
    (interactive)
    (cond ((not (fboundp 'treemacs-get-local-window)) (spacemacs/toggle-maximize-buffer)) ; If no treemacs, just maximize
          ((and (treemacs-get-local-window) (cdr (winum--window-list)))                   ; If treemacs and other windows, delete treemacs and maximize
           (progn (delete-window (treemacs-get-local-window))
                  (spacemacs/toggle-maximize-buffer)))
          ((treemacs-get-local-window)                                                   ; If just treemacs, delete it and do nothing else
           (delete-window (treemacs-get-local-window)))
          (t (spacemacs/toggle-maximize-buffer))                                         ; Else, only toggle maximize
          ))

  (defun my/maximize-first ()
    "Go to buffer 1 and maximize"
    (interactive)
    (select-window (frame-first-window))
    (my/super-maximize-buffer))

  (defun win-copy-selected-text (start end)
    "Copy selected region to Windows clipboard"
    (interactive "r")
    (if (use-region-p)
        (let ((text (buffer-substring-no-properties start end)))
          (shell-command (concat "echo '" text "' | clip.exe")))))

  (defun win-paste ()
    "Paste from Windows clipboard"
    (interactive)
    (let ((clipboard
           (shell-command-to-string "powershell.exe -command 'Get-Clipboard' 2> /dev/null")))
      (setq clipboard (replace-regexp-in-string "\r\n" "\n" clipboard)) ; Remove ^M
      (setq clipboard (replace-regexp-in-string "\r" "\n" clipboard)) ; Convert ^M into newline
      (setq clipboard (substring clipboard 0 -1)) ; Remove newline added by Powershell
      (insert clipboard)))

  (defun my/makeCursorAtPoint (ev)
    "Make a cursor at mouse point."
    (interactive "e")
    (let ((p1 (posn-point (event-start ev))))
      (goto-char p1)
      (evil-mc-make-cursor-here))
    )

  (defun my/autoping ()
    "Ping www.google.com in a vterm"
    (interactive)
    (let ((bufname "Ping"))
      (with-output-to-temp-buffer bufname
        (start-process "ping" bufname "ping" "-c" "4" "www.google.com"))))

  ;; Web search functionality
  (defcustom my/websearch-browser-command "xdg-open"
    "Browser for web calls")
  (defcustom my/websearch-querystr "https://duckduckgo.com/?q="
    "How to search. Will be concatted before the query string")

  (defun escape-html (str)
    (replace-regexp-in-string "&" "&amp;"
                              (replace-regexp-in-string "<" "&lt;"
                                                        (replace-regexp-in-string ">" "&gt;"
                                                                                  (replace-regexp-in-string "\"" "&quot;"
                                                                                                            (replace-regexp-in-string "'" "&#039;"
                                                                                                                                      (replace-regexp-in-string " " "%20" str)))))))

  (defun my/websearch ()
    "Search in external web browser"
    (interactive)
    (if (use-region-p)
        (let* ((query-text (escape-html (buffer-substring (region-beginning) (region-end)))))
          (call-process-region nil nil my/websearch-browser-command nil nil nil (concat my/websearch-querystr query-text)))
      (message "No region selected")))

  (global-set-key (kbd "<f10>") 'my/super-maximize-buffer)
  (global-set-key (kbd "<f9>") 'eyebrowse-next-window-config)
  (global-set-key (kbd "<f7>") 'eyebrowse-prev-window-config)
  (global-set-key (kbd "S-<escape>") 'my/maximize-first)
  (global-set-key (kbd "C-<f10>") 'centaur-tabs-mode)
  (global-set-key (kbd "C-<f6>") 'spacemacs/default-pop-shell)

  (global-set-key (kbd "C->") 'evil-numbers/inc-at-pt)
  (global-set-key (kbd "C-<") 'evil-numbers/dec-at-pt)

  (global-set-key (kbd "C-SPC") 'company-complete)

  ;; Compleseus configurations
  (setq which-key-use-C-h-commands t) ;; Enable paging commands for which key

  ;; Multicursor with the mouse
  (global-set-key [M-mouse-2] 'my/makeCursorAtPoint)

  (add-to-list 'auto-mode-alist '("\\.sc\\|.mill\\'" . scala-mode))
  ;; Scala bindings
  (with-eval-after-load 'scala-mode
    (progn
      (define-key scala-mode-map [f8] 'lsp-treemacs-symbols)
      (define-key scala-mode-map (kbd "S-<f8>") 'lsp-metals-treeview)
      (define-key scala-mode-map (kbd "C-M-e") 'flycheck-list-errors)
      (define-key scala-mode-map (kbd "C-M-t") 'lsp-metals-toggle-show-inferred-type)
      (define-key scala-mode-map (kbd "C-M-i") 'lsp-metals-toggle-show-implicit-conversions)
      (define-key scala-mode-map (kbd "C-M-a") 'lsp-metals-toggle-show-implicit-arguments)
      (define-key scala-mode-map (kbd "<f5>") 'sbt-hydra)
      ))

  (eval-after-load 'sbt-mode '(define-key comint-mode-map (kbd "<f5>") 'sbt-hydra))

  ;; LSP General Bindings
  (with-eval-after-load 'lsp-mode
    (progn
      (define-key lsp-mode-map (kbd "C-S-w") 'lsp-extend-selection)
      (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]out\\'")
      ))
  ;; (eval-after-load 'lsp-mode '(define-key lsp-mode-map (kbd "C-S-w") 'lsp-extend-selection))

  (global-set-key (kbd "<f2>") 'spacemacs/next-error)
  (global-set-key (kbd "S-<f2>") 'spacemacs/previous-error)
  ;;  Auto show lsp ui documentation
  (setq lsp-ui-doc-show-with-cursor t)

  (global-set-key (kbd "C-'") 'spacemacs/projectile-shell-pop)
  ;; (global-set-key (kbd "<f12>") 'spacemacs/projectile-shell-pop)

  ;; (setq winum-scope 'frame-local)
  (setq dired-listing-switches "-laDh --group-directories-first")
  (setq scroll-margin 5)

  ;; Change default terminal for terminal-here
  ;; (setq terminal-here-linux-terminal-command 'tilix)


  (setq python-shell-interpreter "python3")

  (pixel-scroll-precision-mode)

  (global-set-key (kbd "C-{") 'spacemacs/tabs-backward)
  (global-set-key (kbd "C-}") 'spacemacs/tabs-forward)

  ;; Make selection to $ not include newline
  ;; (setq evil-want-visual-char-semi-exclusive 1)
  (setq evil-v$-excludes-newline t)

  ;; Fix error for tramp trying to open nonexistent file
  ;; (with-eval-after-load 'tramp-archive (setq tramp-archive-enabled nil))

  ;; Put all undo tree files in a single place to avoid polluting directories
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))

  ;; Enable auto-fill by default in org-mode
  (add-hook 'org-mode-hook 'auto-fill-mode)
  ;; (global-emojify-mode)

  (beacon-mode)
  (setq beacon-blink-when-point-moves-vertically 1)
  (setq beacon-blink-when-window-scrolls 1)

  (setq vc-follow-symlinks t)

  ;; Configure org-mode
  (with-eval-after-load 'org
    (progn
      ;; Get org-download-screenshot working on Windows
      (setq org-download-screenshot-method "/mnt/c/Users/kdoom/scoop/apps/imagemagick/current/convert.exe clipboard: %s")
      ;; Load babel languages
      (org-babel-do-load-languages
       'org-babel-load-languages
       '((scala . t)
         (dot . t)
         (python . t)
         (shell . t)
         (verb . t)
         (emacs-lisp . t)))
      (setq org-babel-python-command "python3")
      (setq org-startup-indented t)
      (setq org-startup-shrink-all-tables t)
      (setq org-confirm-babel-evaluate nil)

      ;; Org mode tweaks
      (setq org-capture-templates
            '(("t" "Basic TODO" entry
               (file+headline "/mnt/c/Users/kdoom/Dropbox/roam/20210821070005-active_todos.org" "Unsorted")
               "** TODO %?\n:PROPERTIES:\n:CREATED: %U\n:END:" :jump-to-captured t)
              ("w" "Walkerapp TODO" entry
               (file+olp "/mnt/c/Users/kdoom/Dropbox/roam/20210821070005-active_todos.org" "Code" "Walker")
               "** TODO %? :WalkerApp:\n:PROPERTIES:\n:CREATED: %U\n:END:")))

      ;; Org Roam
      (setq org-roam-directory (file-truename "/home/doomsday/Dropbox/roam/"))
      (org-roam-db-autosync-enable)
      (spacemacs/set-leader-keys-for-major-mode 'org-mode "rn" 'org-roam-dailies-goto-next-note)
      (spacemacs/set-leader-keys-for-major-mode 'org-mode "rp" 'org-roam-dailies-goto-previous-note)
      ))

  ;; Roam backlink fixes
  (global-page-break-lines-mode -1)

  (defun display-line-numbers-customize ()
    (setq display-line-numbers 't))
  (add-hook 'org-mode-hook 'display-line-numbers-customize)
  (advice-add 'org-roam-buffer-persistent-redisplay :before
              (lambda () (remove-hook 'org-mode-hook 'display-line-numbers-customize)))
  (advice-add 'org-roam-buffer-persistent-redisplay :after
              (lambda () (add-hook 'org-mode-hook 'display-line-numbers-customize)))

  ;; Add the Scala icon to .mill files
  (with-eval-after-load 'treemacs
    (treemacs-modify-theme (treemacs-current-theme)
      :config
      (progn
        (treemacs-create-icon :file "scala.png" :fallback "" :extensions ("mill"))))
    )

  ;;====== Loop flycheck next/prev error
  ;; Optional: ensure flycheck cycles, both when going backward and forward.
  ;; Tries to handle arguments correctly.
  ;; Since flycheck-previous-error is written in terms of flycheck-next-error,
  ;; advising the latter is enough.
  (defun flycheck-next-error-loop-advice (orig-fun &optional n reset)
                                        ; (message "flycheck-next-error called with args %S %S" n reset)
    (condition-case err
        (apply orig-fun (list n reset))
      ((user-error)
       (let ((error-count (length flycheck-current-errors)))
         (if (and
              (> error-count 0)                   ; There are errors so we can cycle.
              (equal (error-message-string err) "No more Flycheck errors"))
             ;; We need to cycle.
             (let* ((req-n (if (numberp n) n 1)) ; Requested displacement.
                                        ; An universal argument is taken as reset, so shouldn't fail.
                    (curr-pos (if (> req-n 0) (- error-count 1) 0)) ; 0-indexed.
                    (next-pos (mod (+ curr-pos req-n) error-count))) ; next-pos must be 1-indexed
                                        ; orig-fun is flycheck-next-error (but without advise)
                                        ; Argument to flycheck-next-error must be 1-based.
               (apply orig-fun (list (+ 1 next-pos) 'reset)))
           (signal (car err) (cdr err)))))))

  (advice-add 'flycheck-next-error :around #'flycheck-next-error-loop-advice)
  ;;====== End loop flycheck next/prev error

  (setq ob-mermaid-cli-path "/home/doomsday/.nvm/versions/node/v16.20.2/bin/mmdc")

  ;; FIXES -- Remove if not needed anymore
  (if (not (boundp 'completion-lazy-hilit)) (setq completion-lazy-hilit t))
  )


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(magit-gitflow-release-finish-arguments '("--push"))
 '(org-agenda-files '("~/Dropbox/Http4s.org" "~/Dropbox/Main.org"))
 '(package-selected-packages
   '(tern npm-mode nodejs-repl livid-mode skewer-mode js2-refactor multiple-cursors js2-mode js-doc import-js grizzl helm-gtags ggtags counsel-gtags counsel swiper ivy add-node-modules-path lsp-ui lsp-java flycheck-haskell company-lsp centaur-tabs xterm-color ws-butler winum which-key web-mode volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit sql-indent spotify spaceline powerline smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs rainbow-mode rainbow-identifiers rainbow-delimiters pug-mode powershell popwin persp-mode pcre2el paradox spinner orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-plus-contrib org-mime org-download org-bullets open-junk-file noflet neotree multi-term move-text mmm-mode markdown-toc markdown-mode magit-gitflow macrostep lorem-ipsum linum-relative link-hint intero flycheck insert-shebang indent-guide hydra hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-spotify-plus multi helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-hoogle helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets haml-mode google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md fuzzy flx-ido flx fish-mode fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit git-commit ghub treepy graphql with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight eshell-z eshell-prompt-extras esh-help ensime sbt-mode scala-mode emmet-mode elisp-slime-nav dumb-jump f dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat diminish diff-hl define-word company-web web-completion-data company-statistics company-shell company-ghci company-ghc ghc haskell-mode company-emacs-eclim eclim s company-cabal company column-enforce-mode color-identifiers-mode dash cmm-mode clean-aindent-mode bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup))
 '(tabbar-separator '(0.5)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
