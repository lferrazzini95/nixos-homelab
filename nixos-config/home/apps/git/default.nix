{
  pkgs,
  ...
}: {
programs.git = {
  enable = true;
  settings = {
    user = {
      name = "lferrazzini95";
      email = "luca733@gmail.com";
    };
    init.defaultBranch = "main";
    pull.rebase = true;
    core.editor = "nvim";
  };
  
  # Global gitignore
  ignores = [ 
    ".DS_Store" 
    "*.swp" 
    "result"
    "result-*"
    ];
};
}
