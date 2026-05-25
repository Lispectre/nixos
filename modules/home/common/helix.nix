{ pkgs, ... }:
let
  # crazy thing for a runner
  hx-run = pkgs.writeTextFile {
    name = "hx-run";
    destination = "/bin/hx-run";
    executable = true;
    text = ''
      #!/usr/bin/env nu

      def main [lang: string] {
        let cmd = match $lang {
          "rust"                   => "cargo run",
          "python"                 => {
            if ("main.py" | path exists)        { "python main.py" }
            else if ("pyproject.toml" | path exists) { $"python -m (pwd | path basename)" }
            else                                { "python main.py" }
          },
          "javascript" | "typescript" => {
            if ("package.json" | path exists) { "npm run dev | npm start" }
            else                              { "node index.js" }
          },
          "racket" => {
            let entry = (ls *.rkt | get name | first? | default "main.rkt")
            $"racket ($entry)"
          },
          "nix" => "nix run",
          "c" | "cpp" => {
            if ("Makefile" | path exists) or ("makefile" | path exists) {
              $"make && ./( pwd | path basename)"
            } else if ("CMakeLists.txt" | path exists) {
              let name = (pwd | path basename)
              $"cmake -B build && cmake --build build && ./build/($name)"
            } else {
              "echo 'No build system found'"
            }
          },
          _ => $"echo 'No runner configured for language: ($lang)'"
        }

        let final_cmd = if ("flake.nix" | path exists) {
          $"nix develop --command nu --commands '($cmd)'"
        } else {
          $cmd
        }

        zellij run --floating -- nu --commands $final_cmd
      }
    '';
  };
in
{
  home.packages = [ hx-run ];

  programs.helix = {
    enable = true;
    settings = {
      theme = "monokai";
      editor = {
        line-number = "relative";
        bufferline = "multiple";
        cursorline = true;
        shell = [ "nu" "--commands" ];
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
      keys.normal."C-;" = ":sh hx-run %{language}";
    };
  };
}
