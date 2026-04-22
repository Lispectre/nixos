{ pkgs, ... }:

{
  programs.brave = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden Password Manager
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # Dark Reader
      # { id = "dhdgffkkebhmkfjojejmpbldmpobfkfo"; } # Tampermonkey
      { id = "ammjkodgmmoknidbanneddgankgfejfh"; } # 7TV
    ];
  };
}
