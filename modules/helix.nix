{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  environment = {
    shellAliases.x = "hx";
  };

  environment.variables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };

  environment.systemPackages = with pkgs; [
    vscode-langservers-extracted
    typescript-language-server
    nixfmt
    nixfmt-tree
    nil
    rust-analyzer-nightly
    lldb
    yaml-language-server
    zls
    tombi
    clang
    clang-tools
    panache
    harper
    go
    gopls
  ];

  home-manager.sharedModules = [
    {
      programs.helix = {
        enable = true;
        defaultEditor = true;
        package = inputs.helix.packages.${pkgs.stdenv.hostPlatform.system}.default;

        themes = {
          truecolors-dark = {
            "attribute" = "base09";
            "comment" = {
              fg = "base03";
              modifiers = [ "italic" ];
            };
            "constant" = "base09";
            "constant.character.escape" = "base0C";
            "constant.numeric" = "base09";
            "constructor" = "base0D";
            "debug" = "base03";
            "diagnostic" = {
              modifiers = [ "underlined" ];
            };
            "diff.delta" = "base09";
            "diff.minus" = "base08";
            "diff.plus" = "base0B";
            "error" = "base08";
            "function" = "base0D";
            "hint" = "base03";
            "info" = "base0D";
            "keyword" = "base0E";
            "label" = "base0E";
            "namespace" = "base0E";
            "operator" = "base05";
            "special" = "base0D";
            "string" = "base0B";
            "tag" = "base08";
            "type" = "base0A";
            "variable" = "base08";
            "variable.other.member" = "base0D";
            "warning" = "base09";

            "markup.bold" = {
              fg = "base0A";
              modifiers = [ "bold" ];
            };
            "markup.heading.1" = {
              fg = "base0D";
              modifiers = [ "bold" ];
            };
            "markup.heading.2" = {
              fg = "base08";
              modifiers = [ "bold" ];
            };
            "markup.heading.3" = {
              fg = "base09";
              modifiers = [ "bold" ];
            };
            "markup.heading.4" = {
              fg = "base0A";
              modifiers = [ "bold" ];
            };
            "markup.heading.5" = {
              fg = "base0B";
              modifiers = [ "bold" ];
            };
            "markup.heading.6" = {
              fg = "base0C";
              modifiers = [ "bold" ];
            };
            "markup.italic" = {
              fg = "base0E";
              modifiers = [ "italic" ];
            };
            "markup.link.text" = "base08";
            "markup.link.url" = {
              fg = "base09";
              modifiers = [ "underlined" ];
            };
            "markup.list" = "base08";
            "markup.quote" = "base0C";
            "markup.raw" = "base0B";
            "markup.strikethrough" = {
              modifiers = [ "crossed_out" ];
            };

            "diagnostic.hint" = {
              underline = {
                style = "curl";
              };
            };
            "diagnostic.info" = {
              underline = {
                style = "curl";
              };
            };
            "diagnostic.warning" = {
              underline = {
                style = "curl";
              };
            };
            "diagnostic.error" = {
              underline = {
                style = "curl";
              };
            };
            "ui.background" = {
              bg = "base00";
              fg = "base01";
            };
            "ui.bufferline.active" = {
              fg = "base00";
              bg = "base03";
              modifiers = [ "bold" ];
            };
            "ui.bufferline" = {
              fg = "base04";
              bg = "base00";
            };
            "ui.cursor" = {
              fg = "base06";
              modifiers = [ "reversed" ];
            };
            "ui.cursor.primary" = {
              fg = "base05";
              modifiers = [ "reversed" ];
            };
            "ui.cursorline.primary" = {
              fg = "base05";
              bg = "base01";
            };
            "ui.cursor.match" = {
              fg = "base05";
              bg = "base02";
              modifiers = [ "bold" ];
            };
            "ui.cursor.select" = {
              fg = "base05";
              modifiers = [ "reversed" ];
            };
            "ui.gutter" = {
              bg = "base00";
            };
            "ui.help" = {
              fg = "base06";
              bg = "base01";
            };
            "ui.linenr" = {
              fg = "base09";
              bg = "base00";
            };
            "ui.linenr.selected" = {
              fg = "base04";
              bg = "base00";
              modifiers = [ "bold" ];
            };
            "ui.menu" = {
              fg = "base05";
              bg = "base01";
            };
            "ui.menu.scroll" = {
              fg = "base03";
              bg = "base01";
            };
            "ui.menu.selected" = {
              fg = "base01";
              bg = "base04";
            };
            "ui.popup" = {
              bg = "base01";
            };
            "ui.selection" = {
              bg = "base02";
            };
            "ui.selection.primary" = {
              bg = "base02";
            };
            "ui.statusline" = {
              fg = "base04";
              bg = "base01";
            };
            "ui.statusline.inactive" = {
              bg = "base01";
              fg = "base03";
            };
            "ui.statusline.insert" = {
              fg = "base00";
              bg = "base0B";
            };
            "ui.statusline.normal" = {
              fg = "base00";
              bg = "base03";
            };
            "ui.statusline.select" = {
              fg = "base00";
              bg = "base0F";
            };
            "ui.text" = "base05";
            "ui.text.directory" = "base0D";
            "ui.text.focus" = "base05";
            "ui.virtual.indent-guide" = {
              fg = "base03";
            };
            "ui.virtual.inlay-hint" = {
              fg = "base03";
            };
            "ui.virtual.ruler" = {
              bg = "base01";
            };
            "ui.virtual.jump-label" = {
              fg = "base0A";
              modifiers = [ "bold" ];
            };
            "ui.virtual.whitespace" = {
              fg = "base01";
            };
            "ui.window" = {
              fg = "base00";
              bg = "base00";
            };

            palette = {
              base00 = "#0a0c10";
              base01 = "#23252a";
              base02 = "#2672f3";
              base03 = "#6e7681";
              base04 = "#f0f6fc";
              base05 = "#f0f6fc";
              base06 = "#f0f6fc";
              base07 = "#eeeeee";
              base08 = "#f0f3f6";
              base09 = "#ffb757";
              base0A = "#ffb757";
              base0B = "#addcff";
              base0C = "#ffb757";
              base0D = "#ddb7ff";
              base0E = "#ff9492";
              base0F = "#3D2F00";
            };
          };
        };

        settings = {
          theme = lib.mkForce "truecolors-dark";

          editor = {
            auto-format = true;
            auto-completion = true;
            bufferline = "never";
            color-modes = false;
            cursorline = true;
            file-picker.hidden = false;
            idle-timeout = 0;
            line-number = "relative";
            text-width = 140;

            lsp = {
              display-progress-messages = true;
              display-color-swatches = true;
              display-inlay-hints = true;
            };

            cursor-shape = {
              insert = "bar";
              normal = "block";
              select = "underline";
            };

            statusline.mode = {
              insert = "INSERT";
              normal = "NORMAL";
              select = "SELECT";
            };

            indent-guides = {
              character = "▏";
              render = false;
            };

            whitespace.render = {
              tab = "all";
              space = "all";
            };

            whitespace.characters = {
              tab = "·";
              space = "·";
            };
          };

          keys.normal = {
            X = "extend_line_above";
          };
        };

        languages = {
          language-server = {
            rust-analyzer = {
              command = "rust-analyzer";
              config = {
                procMacro = {
                  enable = true;
                };

                cargo = {
                  buildScripts = {
                    enable = true;
                  };
                };
              };
            };
            eslint-ls = {
              command = "vscode-eslint-language-server";
              args = [ "--stdio" ];
              config = {
                validate = "on";
                run = "onType";
                experimental = {
                  useFlatConfig = false;
                };
                rulesCustomizations = [ ];
                nodePath = "";
                problems = {
                  shortenToSingleLine = false;
                };
                codeAction = {
                  disableRuleComment = {
                    enable = true;
                    location = "separateLine";
                  };
                  showDocumentation = {
                    enable = true;
                  };
                };
                workingDirectory = {
                  mode = "location";
                };
              };
            };
            panache-ls = {
              command = "panache";
              args = [ "lsp" ];
            };
            harper-ls = {
              command = "harper-ls";
              args = [ "--stdio" ];
            };
            gopls = {
              command = "gopls";

              config = {
                gofumpt = false;
                staticcheck = true;
                usePlaceholders = true;

                hints = {
                  assignVariableTypes = true;
                  compositeLiteralFields = true;
                  constantValues = true;
                  functionTypeParameters = true;
                  parameterNames = true;
                  rangeVariableTypes = true;
                };
              };
            };
          };

          language = [
            {
              name = "rust";
              auto-format = true;
              language-servers = [ "rust-analyzer" ];
            }
            {
              name = "java";
              auto-format = true;
            }
            {
              name = "html";
              auto-format = true;
            }
            {
              name = "css";
              auto-format = true;
            }
            {
              name = "scss";
              auto-format = true;
            }
            {
              name = "javascript";
              language-id = "javascript";
              auto-format = true;
              file-types = [
                "js"
                "jsx"
                "mjs"
              ];
              roots = [
                "package.json"
                ".eslintrc.js"
              ];
              language-servers = [
                "eslint-ls"
                "typescript-language-server"
              ];
            }
            {
              name = "typescript";
              language-id = "typescript";
              auto-format = true;
              file-types = [
                "ts"
                "tsx"
                "mts"
              ];
              roots = [
                "package.json"
              ];
              language-servers = [
                "eslint-ls"
                "typescript-language-server"
              ];
            }
            {
              name = "markdown";
              auto-format = true;
              language-servers = [
                "panache-ls"
                "harper-ls"
              ];
            }
            {
              name = "yaml";
              auto-format = true;
            }
            {
              name = "json";
              auto-format = true;
            }
            {
              name = "jsonc";
              auto-format = true;
            }
            {
              name = "toml";
              auto-format = true;
            }
            {
              name = "nix";
              auto-format = true;
              formatter.command = "nixfmt -";
              language-servers = [
                "nil"
              ];
            }
            {
              name = "go";
              auto-format = true;
              formatter = {
                command = "gofmt";
              };
              language-servers = [
                "gopls"
              ];
            }
          ];
        };
      };
    }
  ];
}
