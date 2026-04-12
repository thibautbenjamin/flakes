{
  trivialBuild,
  fetchFromGitHub,
}:
trivialBuild rec {
  pname = "org-modern-indent";
  version = "main";

  src = fetchFromGitHub {
    owner = "jdtsmith";
    repo = "org-modern-indent";
    rev = "f2b859bc53107b2a1027b76dbf4aaebf14c03433";
    sha256 = "sha256-vtbaa3MURnAI1ypLueuSfgAno0l51y3Owb7g+jkK6JU=";
  };
}
