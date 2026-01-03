{
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-tree-lua;
        type = "lua";
        config = builtins.readFile ./plugins/nvim-tree.lua;
      }
    ];
    
    extraLuaConfig = builtins.readFile ./config/init.lua;
    
    extraPackages = with pkgs; [
      # Minimal dependencies for terminal/file operations
      fzf
      gcc
      ripgrep
    ];
  };
}
