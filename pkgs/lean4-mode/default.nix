{
  melpaBuild,
  fetchFromGitHub,
  melpaPackages,
  writeText,
}:
melpaBuild rec {
    pname = "lean4-mode";
    version = "1";
    commit = "37d5c99b7b29c80ab78321edd6773200deb0bca6";
    src = fetchFromGitHub {
      owner = "leanprover";
      repo = "lean4-mode";
      rev = commit;
      sha256 = "sha256-+dRaXB7uvN/weSZiKcfSKWhcdJVNg9Vg8k0pJkDNjpc=";
    };
    packageRequires = with melpaPackages;
      [ dash f flycheck magit-section lsp-mode s ];
    recipe = writeText "recipe" ''
               (lean4-mode :repo "leanprover/lean4-mode" :fetcher github)
             '';
}
