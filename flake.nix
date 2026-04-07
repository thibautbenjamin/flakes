{
  description = "Declarations of my flakes";

  inputs = {
  };

  outputs = { self, ... }: {
    modules.homeManager.minimal-emacs = { config, pkgs, lib, ... }: {
      options.emacs.minimal = {
        enable = lib.mkEnableOption "minimal emacs config";

        path = lib.mkOption {
          type = lib.types.str;
          default = "${config.home.homeDirectory}/.config/emacs";
          description = "installation path";
        };

        preInit = lib.mkOption {
          type = lib.types.either lib.types.lines lib.types.path;
          default = ";;; pre-init.el -*- no-byte-compile: t; lexical-binding: t; -*-";
          description = "content of the pre-init file";
        };

        postInit = lib.mkOption {
          type = lib.types.either lib.types.lines lib.types.path;
          default = ";;; post-init.el -*- no-byte-compile: t; lexical-binding: t; -*-";
          description = "content of the post-init file";
        };

        preEarlyInit = lib.mkOption {
          type = lib.types.either lib.types.lines lib.types.path;
          default = ";;; pre-early-init.el -*- no-byte-compile: t; lexical-binding: t; -*-";
          description = "content of the pre-early-init file";
        };

        postEarlyInit = lib.mkOption {
          type = lib.types.either lib.types.lines lib.types.path;
          default = ";;; post-early-init.el -*- no-byte-compile: t; lexical-binding: t; -*-";
          description = "content of the pre-init file";
        };
      };

      config = let
        src = pkgs.fetchFromGitHub {
          owner = "jamescherti";
          repo = "minimal-emacs.d";
          rev = "88559a044cb87b5de9ece739adaf692b0b6d37cf";
          sha256 = "sha256-UksKCdhJX1evguYmHaM3QBgj9IxhAgo1P+4vkwFvdgU=";
        };
        cfg = config.emacs.minimal;
      in
        {
          home.file = {
            "${cfg.path}/early-init.el" = {
              source = "${src}/early-init.el";
            };
            "${cfg.path}/init.el" = {
              source = "${src}/init.el";
            };
            "${cfg.path}/pre-init.el" =
              if lib.isString cfg.preInit then { text = cfg.preInit; }
              else if lib.isPath cfg.preInit then { source = cfg.preInit; }
              else throw "must be either a string or a path";

            "${cfg.path}/post-init.el" =
              if lib.isString cfg.postInit then { text = cfg.postInit; }
              else if lib.isPath cfg.postInit then { source = cfg.postInit; }
              else throw "must be either a string or a path";

            "${cfg.path}/pre-early-init.el" =
              if lib.isString cfg.preEarlyInit then { text = cfg.preEarlyInit; }
              else if lib.isPath cfg.preEarlyInit then { source = cfg.preEarlyInit; }
              else throw "must be either a string or a path";

            "${cfg.path}/post-early-init.el" =
              if lib.isString cfg.postEarlyInit then { text = cfg.postEarlyInit; }
              else if lib.isPath cfg.postEarlyInit then { source = cfg.postEarlyInit; }
              else throw "must be either a string or a path";

          };
        };
    };
  };
}
