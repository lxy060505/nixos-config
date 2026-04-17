{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Lewis";
	      email = "me@lewxx.com";
	    };
    init.defaultBranch = "main";
    core.editor = "nvim";
    };
  };
}
