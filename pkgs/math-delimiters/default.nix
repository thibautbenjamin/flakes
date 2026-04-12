{
  trivialBuild,
  fetchFromGitHub,
}:
trivialBuild rec {
  pname = "math-delimiters";
  version = "master";

  src = fetchFromGitHub {
    owner = "oantolin";
    repo = "math-delimiters";
    rev = "742b93a6d09d80d4c241a25e7cfaf31012dd85c6";
    sha256 = "sha256-/N8VaPEXT9HlGBJk9P2ktcDMdafAJs+u3Cc3gSKIcZA=";
  };
}
