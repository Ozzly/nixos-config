{ pkgs, lib, ... }:

{
  programs.nvf = {
    enable = true;
	  settings.vim = {
	    theme = {
	      enable = true;
	      name = "catppuccin";
	      style = "mocha";
	    };
            telescope.enable = true;
            autocomplete.nvim-cmp.enable = true;

            lsp.enable = true;
            languages = {
              enableTreesitter = true;

              nix.enable = true;
            };

	  };

	};

}
