{
  pkgs,
  ...
}: {
  home.stateVersion = "24.05";

  imports = [
    (import ./apps/nvim/default.nix {inherit pkgs;})
    (import ./apps/git/default.nix {inherit pkgs;})
  ];

  home.packages = with pkgs; [
    git
    fzf
    gcc
    ripgrep
    kubectl
    kubernetes-helm
  ];

  programs = {
    home-manager.enable = true;
    zoxide.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
