{ config, pkgs, ... }:

{
  imports = [
    ./hyprpaper.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$terminal" = "alacritty";
      "$mod" = "SUPER";
      "$menu" = "rofi -show drun";
      "$browser" = "librewolf";

      monitor = [
        "DP-1, 2560x1440@120, 0x0, 1"
        "HDMI-A-1, 1920x1080@60, 2560x0, 1"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      exec-once = [
        "$HOME/scripts/random_wallpaper.sh"
        "$HOME/scripts/repeat_alarm.sh 30 'Posture Check'"
      ];

      cursor = {
        "no_hardware_cursors" = "true";
      };

      input = {
        "kb_layout" = "gb";
        "kb_options" = "caps:swapescape";

        "follow_mouse" = "1";
	"sensitivity" = "-0.3";
      };

      bind = [
        "$mod, Q, killactive,"
        "$mod, SPACE, exec, $menu"
        "$mod, B, exec, $browser"
        "$mod, RETURN, exec, $terminal"
        "$mod, F, fullscreen, "
        "$mod, /, exit, "
        "$mod, N, togglefloating, "
        "$mod, M, centerwindow, "
        "$mod, T, togglesplit, "
        "$mod, A, exec, grim -g \"$(slurp -w 0)\" - | swappy -f - "
	"$mod, R, exec, hyprlock"

	"$mod, V, exec, $HOME/scripts/rofi-password.sh"
	"$mod, C, exec, $HOME/scripts/catmarks/catmarks.sh"

        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

	"$mod SHIFT, 1, movetoworkspacesilent, 1"
        "$mod SHIFT, 2, movetoworkspacesilent, 2"
        "$mod SHIFT, 3, movetoworkspacesilent, 3"
        "$mod SHIFT, 4, movetoworkspacesilent, 4"
        "$mod SHIFT, 5, movetoworkspacesilent, 5"
        "$mod SHIFT, 6, movetoworkspacesilent, 6"
        "$mod SHIFT, 7, movetoworkspacesilent, 7"
        "$mod SHIFT, 8, movetoworkspacesilent, 8"
        "$mod SHIFT, 9, movetoworkspacesilent, 9"
        "$mod SHIFT, 0, movetoworkspacesilent, 10"

        "$mod control_l, 1, movetoworkspace, 1"
        "$mod control_l, 2, movetoworkspace, 2"
        "$mod control_l, 3, movetoworkspace, 3"
        "$mod control_l, 4, movetoworkspace, 4"
        "$mod control_l, 5, movetoworkspace, 5"
        "$mod control_l, 6, movetoworkspace, 6"
        "$mod control_l, 7, movetoworkspace, 7"
        "$mod control_l, 8, movetoworkspace, 8"
        "$mod control_l, 9, movetoworkspace, 9"
        "$mod control_l, 0, movetoworkspace, 10"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      general = {
        gaps_in = 4;
        gaps_out = 8;

        border_size = 3;

        "col.active_border" = "rgb(cba6f7)";
        "col.inactive_border" = "rgb(313244)";

        resize_on_border = "false";
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        rounding_power = 2;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;

        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
        ];

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };


    };
  };

}
