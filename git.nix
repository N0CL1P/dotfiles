{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "N0CL1P";
      user.email = "lolakforgame1337@gmail.com";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };
}
