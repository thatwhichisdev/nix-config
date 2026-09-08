{
  inputs,
  pkgs,
  ...
}:
{
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  environment.systemPackages = with pkgs; [
    slurp
    wf-recorder
    wl-screenrec
    wl-clipboard-rs
    cliphist
    gifsicle
    gnome-control-center
    xwayland-satellite-unstable
  ];

  services.libinput.enable = true;
  programs.xwayland.enable = true;

  home-manager.sharedModules = [
    {
      imports = [ inputs.niri.homeModules.niri ];

      programs.niri = {
        enable = true;
        package = pkgs.niri-unstable;
        settings = {
          cursor = {
            theme = "apple-cursor";
            size = 7;
            hide-when-typing = true;
          };

          blur = {
            enable = true;
            passes = 3;
            offset = 3.0;
            noise = 0.02;
            saturation = 1.5;
          };

          prefer-no-csd = true;

          spawn-at-startup = [
            {
              command = [
                "noctalia-shell"
              ];
            }
          ];

          input = {
            keyboard.xkb.layout = "us,ru";
            keyboard.xkb.options = "grp:alt_shift_toggle";

            focus-follows-mouse.enable = true;
            warp-mouse-to-focus.enable = true;
            workspace-auto-back-and-forth = true;

            touchpad = {
              click-method = "button-areas";
              dwt = true;
              dwtp = true;
              natural-scroll = true;
              scroll-method = "two-finger";
              tap = true;
              tap-button-map = "left-right-middle";
              middle-emulation = true;
              accel-profile = "adaptive";
            };

            mouse = {
              accel-profile = "flat";
              accel-speed = -0.5;
            };
          };

          outputs = {
            "eDP-1" = {
              mode = {
                width = 3456;
                height = 2160;
                refresh = 120.000;
              };
              position = {
                x = 2560;
                y = 0;
              };
              scale = 2.0;
            };

            "DP-1" = {
              mode = {
                width = 2560;
                height = 1440;
                refresh = 239.958;
              };
              position = {
                x = 0;
                y = 0;
              };
              scale = 1.0;
              focus-at-startup = true;
            };
          };

          screenshot-path = "~/Screenshots/screenshot-%Y-%m-%d-%H-%M-%S.png";

          gestures = {
            hot-corners.enable = false;
          };

          layout = {
            background-color = "#000000";

            focus-ring = {
              enable = false;
              width = 0;
              active.color = "#d8dadd";
              inactive.color = "#0a0c10";
            };

            border = {
              enable = true;
              width = 1;
              active.color = "#d8dadd";
              inactive.color = "#0a0c10";
            };

            shadow = {
              enable = false;
            };

            preset-column-widths = [
              { proportion = 0.25; }
              { proportion = 0.5; }
              { proportion = 0.75; }
              { proportion = 1.0; }
            ];

            default-column-width = {
              proportion = 0.5;
            };

            gaps = 9;

            struts = {
              left = 0;
              right = 0;
              top = 0;
              bottom = 0;
            };

            tab-indicator = {
              hide-when-single-tab = true;
              place-within-column = true;
              position = "left";
              corner-radius = 0.0;
              gap = -12.0;
              gaps-between-tabs = 10.0;
              width = 4.0;
              length.total-proportion = 0.1;
            };
          };

          window-rules = [
            {
              draw-border-with-background = false;
              geometry-corner-radius = {
                top-left = 4.0;
                top-right = 4.0;
                bottom-left = 4.0;
                bottom-right = 4.0;
              };
              clip-to-geometry = true;
            }
            {
              matches = [
                {
                  app-id = "^com\\.mitchellh\\.ghostty$";
                }
              ];

              background-effect = {
                blur = true;
                xray = true;
              };
            }
            {
              matches = [
                {
                  app-id = "^ghost-shell-finder$";
                }
                {
                  app-id = "^ghost-shell-launcher$";
                }
              ];

              geometry-corner-radius = {
                top-left = 4.0;
                top-right = 4.0;
                bottom-left = 4.0;
                bottom-right = 4.0;
              };

              open-floating = true;

              background-effect = {
                blur = false;
                xray = false;
              };
            }
          ];

          layer-rules = [
            {
              matches = [
                {
                  namespace = "^ghost-shell-bar$";
                }
              ];

              background-effect = {
                blur = true;
                xray = true;
              };
            }
          ];

          binds = {
            "Mod+D".action.spawn-sh = "ghost-shell msg launcher toggle";
            "Mod+Shift+D".action.spawn-sh = "ghost-shell msg finder toggle";
            "Mod+L".action.spawn-sh = "ghost-shell msg session lock";

            "Mod+Return".action.spawn = "ghostty";
            "Mod+Q".action.close-window = { };
            "Mod+S".action.switch-preset-column-width = { };
            "Mod+F".action.maximize-column = { };
            "Mod+Shift+F".action.fullscreen-window = { };

            "Mod+Space".action.toggle-window-floating = { };
            "Mod+W".action.toggle-column-tabbed-display = { };

            "Mod+Comma".action.consume-window-into-column = { };
            "Mod+Period".action.expel-window-from-column = { };
            "Mod+C".action.center-visible-columns = { };
            "Mod+Tab".action.switch-focus-between-floating-and-tiling = { };

            "Mod+Left".action.focus-column-left = { };
            "Mod+Right".action.focus-column-right = { };
            "Mod+Down".action.focus-workspace-down = { };
            "Mod+Up".action.focus-workspace-up = { };

            "Mod+Shift+Left".action.move-column-left = { };
            "Mod+Shift+Right".action.move-column-right = { };
            "Mod+Shift+Up".action.move-column-to-workspace-up = { };
            "Mod+Shift+Down".action.move-column-to-workspace-down = { };

            "Mod+Ctrl+Left".action.focus-monitor-left = { };
            "Mod+Ctrl+Right".action.focus-monitor-right = { };

            "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = { };
            "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = { };

            "Mod+F12".action.screenshot = { };
            "Mod+Shift+F12".action.screenshot-screen = { };
            "Mod+Shift+Ctrl+F12".action.spawn = "wl-screenrec -g '$(slurp)'";
          };
          debug = {
            render-drm-device = "/dev/dri/renderD128";
            honor-xdg-activation-with-invalid-serial = { };
          };
        };
      };
    }
  ];
}
