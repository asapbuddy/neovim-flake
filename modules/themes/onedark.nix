{ pkgs, config, lib, ... }:
with lib;
with builtins;

let
  cfg = config.vim.theme.onedark;
in
{

  options.vim.theme.onedark = {
    enable = mkEnableOption "Enable onedark theme";

    themeStyle = mkOption {
      default = "deep";
      description =  "Default theme style";
      type = types.enum [ "dark" "darker" "cool" "deep" "warm" "warmer" "light"];
    };


  };

  config = mkIf (cfg.enable)
    (
      let
        mkVimBool = val: if val then "1" else "0";
      in
      {
        vim.configRC = ''
       let g:onedark_config = {
        \ 'style': 'warm',
        \ 'toggle_style_key': '<leader>bg',
        \ 'ending_tildes': v:false,
        \ 'diagnostics': {
          \ 'darker': v:false,
          \ 'background': v:false,
        \ },
      \ }
      colorscheme onedark
          let g:impact_transbg=1
          set t_Co=256
        '';

        vim.startPlugins = with pkgs.neovimPlugins; [ onedark ];

        vim.globals = { };
      }
    );

}
