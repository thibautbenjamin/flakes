# Custom Modules
Declaration of custom nix modules and packages that I use

## Minimal Emacs

This is a home-manager module that installs the
[minimal-emacs](https://github.com/jamescherti/minimal-emacs.d) files. It is
meant to be used along with the home-manager emacs module. The module declares the following options:
- `emacs.minimal.enable` : whether or not to enable the module
- `emacs.minimal.path` : the path where the configuration files should be installed
- `emacs.minimal.preEarlyInit` : the path to the `pre-early-init.el` file or a string containing its content
- `emacs.minimal.postEarlyInit` : the path to the `post-early-init.el` file or a string containing its content
- `emacs.minimal.preInit` : the path to the `pre-init.el` file or a string containing its content
- `emacs.minimal.postInit` : the path to the `post-init.el` file or a string containing its content
